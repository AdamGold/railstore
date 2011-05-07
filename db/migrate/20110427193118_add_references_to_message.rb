class AddReferencesToMessage < ActiveRecord::Migration
  def self.up
  change_table :messages do |t|
    t.references :item
  end

  end

  def self.down
  end
end
