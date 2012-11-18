class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :number
      t.references :title

      t.timestamps
    end
    add_index :issues, :title_id
  end
end
