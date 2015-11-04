Post.delete_all

new_posts = [
  {
    title: 'Sample Post 1', description: 'A sample description for sample post 1. Technology: Ruby on Rails',
    addresses_attributes: [
      {
        address_line_1: 'B-150, Ground Floor',
        address_line_2: 'Gautam Budh Nagar',
        city:           'Noida',
        state:          'Uttar Pradesh',
        pincode:        201301,
        address_type:   'Shipping'
      },{
        address_line_1: 'HCL Towers',
        address_line_2: 'Special Economic Zonem Sector 126',
        city:           'Noida',
        state:          'Uttar Pradesh',
        pincode:        201301,
        address_type:   'Billing'
      }
    ],
  },
  {
    title: 'Sample Post 2', description: 'A sample description for sample post 2. Database: MySQL',
    addresses_attributes: [
      {
        address_line_1: 'B-150, Ground Floor',
        address_line_2: 'Gautam Budh Nagar',
        city:           'Noida',
        state:          'Uttar Pradesh',
        pincode:        201301,
        address_type:   'Shipping'
      }
    ],
  },
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

new_styles = [
  { name: 'Style 1' }, { name: 'Style 2' }, { name: 'Style 3' }, { name: 'Style 4' }
]

new_styles.each do | style_param |
  Style.create(style_param)
end

new_collections = [
  { name: 'Collection 1' }, { name: 'Collection 2' }, { name: 'Collection 3' }, { name: 'Collection 4' }
]

new_collections.each do | collection_param |
  Collection.create collection_param
end

new_features = [
  { name: 'Feature 1' }, { name: 'Feature 2' }, { name: 'Feature 3' }, { name: 'Feature 4' }
]

new_features.each do | feature_param |
  Feature.create feature_param
end