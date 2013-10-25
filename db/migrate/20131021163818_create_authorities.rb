class CreateAuthorities < ActiveRecord::Migration
  create_table :authorities, :options => 'DEFAULT CHARSET=utf8' do |t|
    t.string  :name, null: false, limit: 30
    t.string  :desc, limit: 30
    t.string  :pinyin
    t.string  :value
    t.timestamps
  end
  
end
