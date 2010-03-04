# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


Task.create(:title=>"Mix pizza dough", :active=>true, :minutes=>15)
Task.create(:title=>"Make sauce", :active=>true, :minutes=>30)
Task.create(:title=>"Brown sausage", :active=>true, :minutes=>10)
Task.create(:title=>"Grate cheese", :active=>true, :minutes=>5)
Task.create(:title=>"Let pizza dough rest", :active=>false, :minutes=>120)
Task.create(:title=>"Bake pizza", :active=>true, :minutes=>30)