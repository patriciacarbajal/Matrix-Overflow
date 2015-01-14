FactoryGirl.define do
  factory :category do
    name  Faker::Lorem.word 
  end

  factory :post do
    title  Faker::Lorem.word 
    content Faker::Lorem.sentence
    category_id 1
  end

  factory :user do
    username Faker::Internet.user_name
    email Faker::Internet.email
    password "pass123"
    password_confirmation "pass123"
  end

end
