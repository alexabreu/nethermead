# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name_proper'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/companies?company_name=%QUERY'
});

companies.initialize();
$(document).ready ->
  $('#company-name-search').typeahead(null, {
    displayKey: 'name_proper',
    source: companies.ttAdapter()
  });