class AddRefencesToItemsAndTags < ActiveRecord::Migration
  def self.up
  add_column :items, :user_id, :integer
  add_column :tags, :item_id, :integer
  add_index :items, :user_id
  add_index :tags, :item_id
  end


  def self.down
  remove_column :items, :user_id 
  remove_column :tags, :item_id 
  remove_index :items, :user_id
  remove_index :tags, :item_id

  end
end
