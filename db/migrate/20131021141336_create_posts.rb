class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.string   :title,    null: false
      t.text     :content,  null: false
      t.integer  :user_id,  null: false
      t.integer  :status,   null: false, default: Post::STATUS_PUBLISHED
      t.integer  :display_status, null: false, default: Post::DISPLAY_STATUS_MEMBER
      t.timestamps
    end
  end
end
