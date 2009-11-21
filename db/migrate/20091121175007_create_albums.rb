class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :parent_id
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps 
    end
  end

  def self.down
    drop_table :albums
  end
end