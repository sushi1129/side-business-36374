FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name      {Faker::Commerce.product_name}
    maker          {Faker::Company.name}
    plice          {Faker::Number.within(range: 1..9999999)}
    bought_store   {Faker::FunnyName.name}
    item_info      {Faker::Lorem.sentence}
    association :user
  end
end
