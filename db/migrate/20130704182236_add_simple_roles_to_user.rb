class AddSimpleRolesToUser < ActiveRecord::Migration
  def up
    add_column :users, :owner, :boolean, default: false
    add_column :users, :guest, :boolean, default: true
  end
  
  def down  
    remove_column :users, :owner
    remove_column :users, :guest
  end
end