# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create([
    {name_upper: 'PHILLIP CO', name_proper: 'Phillip Co', id: 1, slug: 'phillip-co'},
    {name_upper: 'ALEX CO', name_proper: 'Alex Co', id: 2, slug: 'alex-co'},
               ])

ProductClass.create([
    {name: 'Commercial Individual', abbr: 'CI', id: 1},
    {name: 'Commercial Small Group', abbr: 'CSG', id: 2}
               ])

State.create([
   {state_name: 'NY', state_full_name: 'New York', id: 1},
   {state_name: 'NJ', state_full_name: 'New Jersey', id: 2},
   {state_name: 'CT', state_full_name: 'Connecticut', id: 3},
               ])

SearchResult.create([
    {company_name: 'Phillip Co', state_name: 'NY', product_class: 'Commercial Individual', company_id: 1, product_class_id: 1, state_id: 1},
    {company_name: 'Phillip Co', state_name: 'NY', product_class: 'Commercial Small Group', company_id: 1, product_class_id: 2, state_id: 1},
    {company_name: 'Phillip Co', state_name: 'NJ', product_class: 'Commercial Small Group', company_id: 1, product_class_id: 2, state_id: 2},
    {company_name: 'Alex Co', state_name: 'NY', product_class: 'Commercial Individual', company_id: 2, product_class_id: 1, state_id: 1},
    {company_name: 'Alex Co', state_name: 'CT', product_class: 'Commercial Small Group', company_id: 2, product_class_id: 2, state_id: 3},
    {company_name: 'Alex Co', state_name: 'NJ', product_class: 'Commercial Small Group', company_id: 2, product_class_id: 2, state_id: 2},
])