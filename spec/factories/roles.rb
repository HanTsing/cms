#encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do

    factory :admin_role do
      name "管理员"
    end
    
  end
end
