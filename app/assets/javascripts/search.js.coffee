
_.templateSettings = {
  interpolate: /\{\{\=(.+?)\}\}/g,
  evaluate: /\{\{(.+?)\}\}/g
};

companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name_proper'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/companies?company_name=%QUERY'
});

companies.initialize();

Company = Backbone.Model.extend({});

window.Company = Company;

ProductClass = Backbone.Model.extend({});

State = Backbone.Model.extend({
  initialize: ->
    this.set({state_abbreviation: this.get('state_name').toLowerCase()});
});

Market = Backbone.Model.extend({
  initialize: ->
    this.state = new State(this.get('state'));
    this.product_class = new ProductClass(this.get('product_class'));
});

window.Market = Market;

Markets = Backbone.Collection.extend({
  model: Market,
  states: ->
    return new States(this.map((market) ->
      return market.state;
    ));
  product_classes: (state) ->
    return new ProductClasses(_.map(this.filter((market) ->
      return market.state.get('id') == state.get('id');
    ), (market) ->
      return market.product_class;
    ));
  get_market: (state, product_class) ->
    return this.find((market) ->
      return market.state.get('id') == state.get('id') && market.product_class.get('id') == product_class.get("id");
    )
});

States = Backbone.Collection.extend({
  model: State
});

ProductClasses = Backbone.Collection.extend({
  model: ProductClass
});

ModelView = Backbone.View.extend({
  render: ->
    this.$el.html(this.template(this.model.attributes));
    return this;
});

CollectionView = Backbone.View.extend({
  ModelView: ModelView,
  render: ->
    this.$el.html(this.template(this.attributes()));
    this.$collection_container = this.$('.collection-container');
    this.collection.bind('add', this.add, this);
    this.collection.bind('reset', this.add_all, this);
    return this;
  attributes: ->
    return {};
  empty: ->
    this.$collection_container.empty();
  add: (item) ->
    this.$collection_container.append(new this.ModelView({
      model: item
    })
    .render()
    .$el);
  add_all: ->
    this.empty();
    this.collection.each(this.add, this);
    this.trigger('added-all');
    return this;
});

StateView = ModelView.extend({
  template: _.template($('#state-template').html()),
  tagName: 'li',
  className: '',
  events: {
    'click a': 'select',
  },
  initialize: ->
    this.model.bind("select", this.choose, this);
  select: (e) ->
    e.preventDefault();
    this.choose();
    return false;
  choose: ->
    markets.state = this.model;
    $("a.selected").removeClass("selected");
    $(".product-classes").remove();
    $(".market-chooser-container").append(new ProductClassesView({
      collection: markets.product_classes(this.model)
    }).render().add_all().$el);
    this.$("a").addClass("selected");
    $('.search-result-button').hide();

});

ProductClassView = ModelView.extend({
  template: _.template($('#product-class-template').html()),
  className: 'col-md-2 product-class-container',
  events: {
    'click a': 'select',
  },
  initialize: ->
    this.model.bind("select", this.choose, this);
  select: (e) ->
    e.preventDefault();
    this.choose();
    return false;
  choose: ->
    $(".product-class-container.selected").removeClass("selected");
    this.$el.addClass("selected");
    $('.search-result-button').attr('href', '/search/' + markets.company.get("slug") + '/'  + markets.state.get("state_name").toLowerCase() + '/' + this.model.get("abbr").toLowerCase()).show();

});

ProductClassesView = CollectionView.extend({
  template: _.template($('#product-classes-template').html()),
  ModelView: ProductClassView,
  className: 'product-classes'
});

StatesView = CollectionView.extend({
  ModelView: StateView,
  template: _.template($('#states-template').html()),
  initialize: ->
    this.bind("added-all", this.create_carousel, this);
    return;
  create_carousel: ->
    console.log("added all " + this.$('li').length + " states");
    if(this.collection.length < 3)
      return;
    this.$('.scrollbar').removeClass('hidden');
    this.$('.sly-control').removeClass('hidden');
    init_pos = 0;
    if(markets.state)
      init_pos = this.collection.indexOf(this.collection.findWhere({id: markets.state.get('id')}));
    this.sly = new Sly(this.$('.frame'), {itemNav: 'basic', horizontal: 1, scrollBar: this.$('.scrollbar'), mouseDragging: 1,  touchDragging: 1, scrollBy: 1, dragHandle: 1, dynamicHandle: 1, startAt: init_pos, prevPage: this.$('.sly-control.left'),  nextPage: this.$('.sly-control.right') }).init();

    return;
});

markets = new Markets();

MarketChooser = Backbone.View.extend({
  initialize: ->
    markets.url = '/company/' + this.model.id + '/markets';
  render: ->
    markets.bind("sync", this.show_states, this);
    markets.fetch();
    return this;
  show_states: ->
    this.$el.empty();
    $(".product-classes").remove();
    $('.search-result-button').hide();
    this.states_view = new StatesView({collection: markets.states()}).render();
    this.$el.html(this.states_view.$el);
    this.states_view.add_all()
    this.trigger("rendered");
});


window.CompanySearch = Backbone.View.extend({
  template: _.template($('#company-search-template').html()),
  render: ->
    this.$el.html(this.template());
    _this = this;
    this.$('.search-result-button').hide();
    this.$('.company-name-search').typeahead(null, {
      displayKey: 'name_proper',
      source: companies.ttAdapter()
    }).on('typeahead:selected', (e, suggestion) ->
      markets.company = new Company(suggestion);
      _this.$('.market-chooser-container').html(new MarketChooser({model: markets.company}).render().$el);
    );
    return this;
  prefill: (company, market) ->
    markets.company = company;
    markets.state = market.state;
    this.$('.company-name-search').val(company.get('name_proper'));
    this.market_chooser = new MarketChooser({model: markets.company});
    _this = this;
    this.market_chooser.on("rendered", ->
      markets.states().each((state) ->
        if(market.state.get("id") == state.get("id"))
          state.trigger("select");
      );
      markets.product_classes(market.state).each((product_class) ->
        if(market.product_class.get("id") == product_class.get("id"))
          product_class.trigger("select");
      );
      return;
    );
    this.$('.market-chooser-container').html(this.market_chooser.$el);
    this.market_chooser.render();
    return true;
});








