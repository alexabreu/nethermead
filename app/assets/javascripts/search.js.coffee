# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

_.templateSettings = {
  interpolate: /\{\{\=(.+?)\}\}/g,
  evaluate: /\{\{(.+?)\}\}/g
};


companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name_proper'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/companies?company_name=%QUERY'
});

Company = Backbone.Model.extend({});

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
    return this;
});


companies.initialize();

$(document).ready ->

  StateView = ModelView.extend({
    template: _.template($('#state-template').html()),
    className: 'col-md-3',
    events: {
      'click a': 'select',
    },
    select: (e) ->
      e.preventDefault();
      markets.state = this.model;
      $("a.selected").removeClass("selected");
      $(".product-classes").remove();
      $("#market-chooser").append(new ProductClassesView({
        collection: markets.product_classes(this.model)
      }).render().add_all().$el);
      this.$("a").addClass("selected");
      $('#search-result-button').hide();
      return false;
  });

  ProductClassView = ModelView.extend({
    template: _.template($('#product-class-template').html()),
    className: 'col-md-2 product-class-container',
    events: {
      'click a': 'select',
    },
    select: (e) ->
      e.preventDefault();
      $(".product-class-container.selected").removeClass("selected");
      this.$el.addClass("selected");
      $('#search-result-button').attr('href', '/search/' + markets.company.get("slug") + '/'  + markets.state.get("state_name") + '/' + this.model.get("abbr")).show();
      return false;
  });

  ProductClassesView = CollectionView.extend({
    template: _.template($('#product-classes-template').html()),
    ModelView: ProductClassView,
    className: 'product-classes'
  });

  StatesView = CollectionView.extend({
    ModelView: StateView,
    template: _.template($('#states-template').html()),
  });

  markets = new Markets();

  MarketChooser = Backbone.View.extend({
    el: $('#market-chooser'),
    initialize: ->
      markets.url = '/company/' + this.model.id + '/markets';
    render: ->
      markets.bind("sync", this.show_states, this);
      markets.fetch();
    show_states: ->
      this.$el.html(new StatesView({collection: markets.states()}).render().add_all().$el);
  });

  $("#search-result-button").hide();

  $('#company-name-search').typeahead(null, {
    displayKey: 'name_proper',
    source: companies.ttAdapter()
  }).on('typeahead:selected', (e, suggestion) ->
    markets.company = new Company(suggestion);
    new MarketChooser({model: markets.company}).render();
  );



