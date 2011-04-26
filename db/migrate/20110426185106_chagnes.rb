class Chagnes < ActiveRecord::Migration
  def self.up
  add_column :items, :license, :string
  add_column :items, :download_file_name, :string 
  add_column :items, :download_content_type, :string
  add_column :items, :download_file_size, :integer

  end

  def self.down
  remove_column :items, :license, :string
  remove_column :items, :download_file_name, :string 
  remove_column :items, :download_content_type, :string
  remove_column :items, :download_file_size, :integer


  end
end
