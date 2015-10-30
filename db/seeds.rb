# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all

new_posts = [
  { title: 'Sample Post 1', description: 'A sample description for sample post 1. Technology: Ruby on Rails' },
  { title: 'Sample Post 2', description: 'A sample description for sample post 2. Database: MySQL' },
  { title: 'Sample Post 3', description: 'A sample description for sample post 3. Server: Webrick on local' },
  { title: 'Sample Post 4', description: 'A sample description for sample post 4. Ruby Version: 2.2.2' },
  { title: 'Sample Post 5', description: 'A sample description for sample post 5. Rails Version: 4.2.4' }
]

new_posts.each do | post_params |
  Post.create post_params
end

Plan.delete_all

new_plans = [
  { plan_number: 'AB1001', name: 'My First Plan', description: 'My first plan description' },
  { plan_number: 'AB1002', name: 'My Second Plan', description: 'My second plan description' },
  { plan_number: 'AB1003', name: 'My Third Plan', description: 'My third plan description' },
  { plan_number: 'AB1004', name: 'My Fourth Plan', description: 'My fourth plan description' },
  { plan_number: 'AB1005', name: 'My Fifth Plan', description: 'My fifth plan description' }
]

new_plans.each do | plan_params |
  Plan.create plan_params
end