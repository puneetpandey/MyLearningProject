FactoryGirl.define do

  factory :feature do
    name "MyString"
  end

  factory :collection do
    name "MyString"
  end

  factory :style do
    name "MyString"
  end

  factory :plan do
    plan_number 'A1001'
		name "MyString"
		description "MyText"
  end

  factory :post do
    title "My First Post"
    description "My first post description"
  end
end
