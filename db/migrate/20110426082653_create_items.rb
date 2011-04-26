class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.text :desc
      t.integer :price
      t.string :live_preview
      t.string :image_preview
      t.string :thumbnail
      t.string :download
      t.string :gems_included

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
