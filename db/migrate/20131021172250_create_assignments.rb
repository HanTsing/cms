class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.integer :authority_id
      t.integer :role_id  
      t.timestamps
    end
  end
end
