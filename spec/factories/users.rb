FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    nick_name { Faker::Lorem.characters(number:7) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end