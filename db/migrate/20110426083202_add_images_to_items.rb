class AddImagesToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :image_preview_file_name, :string 
    add_column :items, :image_preview_content_type, :string
    add_column :items, :image_preview_file_size, :integer
    add_column :items, :thumbnail_file_name, :string 
    add_column :items, :thumbnail_content_type, :string
    add_column :items, :thumbnail_file_size, :integer

  end

  def self.down
    remove_column :items, :image_preview_file_name, :string 
    remove_column :items, :image_preview_content_type, :string
    remove_column :items, :image_preview_file_size, :integer
    remove_column :items, :thumbnail_file_name, :string 
    remove_column :items, :thumbnail_content_type, :string
    remove_column :items, :thumbnail_file_size, :integer
  end
end
