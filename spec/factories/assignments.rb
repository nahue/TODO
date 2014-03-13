# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    description "MyString"
    start_date "2014-03-11 11:45:30"
    end_date "2014-03-11 11:45:30"
    resource nil
  end
end
