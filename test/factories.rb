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
end
