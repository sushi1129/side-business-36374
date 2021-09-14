FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.backward}
    prefecture_id         {Faker::Number.within(range: 1..47)}
    phone_namber          {Faker::Number.number(digits: 11)}
    os_type_id            {Faker::Number.within(range: 1..2)}
    use_app1              {Faker::App.name}
    use_app2              {Faker::App.name}
    profile               {"testテストTEST"}
  end
end