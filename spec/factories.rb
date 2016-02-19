FactoryGirl.define do

  factory :item do
    name Faker::Name.first_name
  end
end