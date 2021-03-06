FactoryBot.define do
  factory :item do
    
    name { Faker::Name.name}
    description { Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    cost_id {2}
    area_id {2}
    days_id {2}
    price {300}
    association :user

    after(:build) do |pic|
      pic.image.attach(io: File.open('spec/models/test_image.png'), filename: 'test_image.png')
    end
  end
end
