class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.integer :status
      t.integer :album_id
      t.integer :user_id

      t.timestamps 
    end
  end

  def self.down
    drop_table :photos
  end
end