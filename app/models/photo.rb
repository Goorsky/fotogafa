class Photo < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'public/images/photos'
  belongs_to :album

  #fix mime-types
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.image_file = data
    self.title = "dodane z SWFupload"
    self.album_id = 1
  end
  
end
