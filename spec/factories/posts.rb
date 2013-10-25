# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title  "new title"
    content "new content"
    user_id 1
    status Post::STATUS_PUBLISHED
    display_status Post::DISPLAY_STATUS_MEMBER

    factory :invalid_post do 
      title ""
    end

    factory :member_post do
      title "member title"
      display_status Post::DISPLAY_STATUS_MEMBER
    end

    factory :non_member_post do
      title "non-member title"
      display_status Post::DISPLAY_STATUS_ALL
    end
  end
end
