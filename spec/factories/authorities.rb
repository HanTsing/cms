#encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authority, :class => 'Authority' do

    factory :show_authority do
      name "查看帖子"
      pinyin "show_post"
      value  1
    end

    factory :create_authority do
      name "创建帖子"
      pinyin "create_post"
      value  2
    end

    factory :edit_authority do
      name "编辑帖子"
      pinyin "edit_post"
      value  4
    end

    factory :delete_authority do
      name "删除帖子"
      pinyin "delete_post"
      value  8
    end
    
  end
end
