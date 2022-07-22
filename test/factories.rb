FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "testtest" }
  end

  factory :tweet do
    body { "testing tweet" }

    trait :user do
      association :user
    end
  end

  factory :like do
    trait :user do
      association :user
    end

    trait :tweet do
      association :tweet
    end
  end
end
