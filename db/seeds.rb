# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(user_name: 'areiro', password: 'areiro2015')
c1 = Category.create(category_name: 'Alarmes', icon_category: '<i class="fa fa-bullhorn"></i>')

c2 = Category.create(category_name: 'Ahd', icon_category: '<i class="fa fa-hdd-o"></i>')
Subcategory.create(subcategory_name: 'DVR', category_id: c2.id)
Subcategory.create(subcategory_name: 'Cameras', category_id: c2.id)

c3 = Category.create(category_name: 'IP', icon_category: '<i class="fa fa-chevron-circle-right"></i>')
Subcategory.create(subcategory_name: 'NVR', category_id: c3.id)
Subcategory.create(subcategory_name: 'Cameras', category_id: c3.id)