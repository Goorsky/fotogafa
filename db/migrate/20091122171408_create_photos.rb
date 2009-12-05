class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.string :camera_company
      t.string :camera_model
      t.string :camera_software
      t.string :author
      t.string :copyright
      t.datetime :take_date
      t.lng :float
      t.lat :float
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