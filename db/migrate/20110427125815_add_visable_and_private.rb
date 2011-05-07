class AddVisableAndPrivate < ActiveRecord::Migration
  def self.up
  add_column :items, :visible, :boolean, :default => false 
  end

  def self.down
   remove_column :items, :visible
  end
  
  
end
