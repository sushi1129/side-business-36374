FactoryBot.define do
  factory :knowledge_comment do
    text {Faker::Lorem.sentence}
    association :user
    association :knowledge
  end
end
