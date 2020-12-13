FactoryBot.define do
  factory :post do
  	user { create(:user) }
  	title { Faker::Lorem.characters(number:5) }
  	subtitle { Faker::Lorem.characters(number:50) }
  	post_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  	body { Faker::Lorem.characters(number:700) }
  end
end