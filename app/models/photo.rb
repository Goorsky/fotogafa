class Photo < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'public/images/photos'
  belongs_to :album
end
