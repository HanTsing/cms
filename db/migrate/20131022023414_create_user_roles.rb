class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.integer :user_id
      t.integer :role_id  
      t.timestamps
    end
  end
end
