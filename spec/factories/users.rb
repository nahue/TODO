# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "john@example.com"
    first_name "john"
    last_name "doe"
    password "secret"
    password_confirmation "secret"
    name "John Doe"

    trait :no_agent do
      role "no_agent"
    end

    trait :agent do
      role "agent"
    end

    trait :admin do
      is_admin true
    end

  end
end
