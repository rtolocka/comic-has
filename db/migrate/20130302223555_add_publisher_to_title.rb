class AddPublisherToTitle < ActiveRecord::Migration
  def up
    remove_column :titles, :publisher
    add_column :titles, :publisher_id, :integer    
  end
  def down
    remove_column :titles, :publisher_id
    add_column :titles, :publisher
  end  
end