# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    factory :admin_user do
      email "John@gmail.com"
      password '12345678'
      password_confirmation '12345678'
    end

  end
end
