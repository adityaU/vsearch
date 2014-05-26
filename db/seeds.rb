require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..100).each do 
  lawyer = Lawyer.new
  lawyer.name = Faker::Name.name
  lawyer.city = Faker::Address.city
  lawyer.service = Faker::Commerce.department
  lawyer.base_price = (1 + Random.rand(50)) *1000 
  lawyer.save
end
