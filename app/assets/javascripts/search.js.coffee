# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name_proper'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/companies?company_name=%QUERY'
});

Company = Backbone.Model.extend({});

ProductOption = Backbone.Model.extend({});

State = Backbone.Model.extend({});

Market = Backbone.Model.extend({
  intialize: ->
    this.state = new State(this.get('state'));
    this.product_option = new ProductOption(this.get('product_option'));
});

Markets = Backbone.Collection.extend({
  model: Market
});

MarketChooser = Backbone.View.extend({
  el: $('#market-chooser'),
  initialize: ->
    this.markets = new Markets();
    this.markets.url = '/company/' + this.model.id + '/markets';
    this.markets.fetch();
});

companies.initialize();

$(document).ready ->
  $('#company-name-search').typeahead(null, {
    displayKey: 'name_proper',
    source: companies.ttAdapter()
  }).on('typeahead:selected', (e, suggestion) ->
    new MarketChooser({model: new Company(suggestion)}).render();
  );


