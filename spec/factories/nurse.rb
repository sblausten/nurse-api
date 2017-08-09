FactoryGirl.define do
  factory :nurse do
    first_name 'Firstname'
    last_name 'Secondname'
    email 'test@test.com'
    role
  end
  factory :role do
  end
end
