class CreateIssueRanges < ActiveRecord::Migration
  def change
    create_table :issue_ranges do |t|
      t.integer :low
      t.integer :high
      t.references :title

      t.timestamps
    end
    add_index :issue_ranges, :title_id
  end
end
