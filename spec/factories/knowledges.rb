FactoryBot.define do
  factory :knowledge do
    after(:build) do |knowledge|
      knowledge.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    knowledge_title { Faker::App.name }
    knowledge_info  { Faker::Lorem.sentences }
    association :user
  end
end
