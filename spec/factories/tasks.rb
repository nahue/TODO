# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    text "MyString"
    completed_at "2014-02-28 15:23:27"
  end
end
