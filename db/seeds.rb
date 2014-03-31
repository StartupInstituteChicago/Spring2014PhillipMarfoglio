# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories_arr = %w(Chinese Italian Mexican Thai Vegetarian Gastropub Indian American Japanese Korean)
categories_arr.each {|category| Category.find_or_create_by(name: category)}

10.times do |count|
  Restaurant.create(name: "MyRestaurant_#{count+1}", description: "", address: "", phone_number: "", photo: nil, menu: nil, owner_id: 1)
end