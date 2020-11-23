FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name                  { 'aaa' }
    description           { 'aaa' }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_charges_id   { 2 }
    prefectures_id        { 2 }
    days_to_ship_id       { 2 }
    selling_price         { 1000 }
    association :user
  end
end
