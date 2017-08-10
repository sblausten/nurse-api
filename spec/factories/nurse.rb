FactoryGirl.define do
  factory :nurse do
    first_name 'firstname'
    last_name 'secondname'
    email 'test@test.com'
    role
  end
  factory :role do
  end
end
