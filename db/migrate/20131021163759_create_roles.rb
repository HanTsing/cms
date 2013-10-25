class CreateRoles < ActiveRecord::Migration

  create_table :roles, :options => 'DEFAULT CHARSET=utf8' do |t|
    t.string :name,    null: false, limit: 30
    t.string :authority
    t.timestamps
  end

end
