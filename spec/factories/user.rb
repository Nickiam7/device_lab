FactoryGirl.define do
  factory :user do
  	username "test_user" 
    email 'test@gmail.com'
    password '12345678'
    password_confirmation '12345678'
  end
end