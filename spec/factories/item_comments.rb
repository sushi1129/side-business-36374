FactoryBot.define do
  factory :item_comment do
    text {Faker::Lorem.sentence}
    association :user
    association :item
  end
end
