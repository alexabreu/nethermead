# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SearchResult.create([
    {company_name: 'Phillip Co', state_name: 'NY', product_class: 'Commercial Individual'},
    {company_name: 'Phillip Co', state_name: 'NY', product_class: 'Commercial Small Group'},
    {company_name: 'Phillip Co', state_name: 'NJ', product_class: 'Commercial Small Group'},
    {company_name: 'Alex Co', state_name: 'NY', product_class: 'Commercial Individual'},
    {company_name: 'Alex Co', state_name: 'NY', product_class: 'Commercial Small Group'},
    {company_name: 'Alex Co', state_name: 'NJ', product_class: 'Commercial Small Group'},
    {company_name: 'Diallo Co', state_name: 'NJ', product_class: 'Commercial Small Group'},
    {company_name: 'Diallo Co', state_name: 'NY', product_class: 'Commercial Small Group'},
    {company_name: 'Diallo Co', state_name: 'CT', product_class: 'Commercial Small Group'}
])