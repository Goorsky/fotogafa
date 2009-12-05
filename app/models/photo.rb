class Photo < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'public/images/photos'
  belongs_to :album
  
  named_scope :accepted, :conditions => { :status => 1 }
  named_scope :waiting, :conditions => { :status => 0 }
  
  before_create :set_exif
  
  #ustawia dane EXIF
  def set_exif
    self.title = self.image_file.get_exif_by_entry('ImageDescription')[0][1] 
    self.camera_model = self.image_file.get_exif_by_entry('Model')[0][1]
    self.camera_company = self.image_file.get_exif_by_entry('Make')[0][1] 
    self.camera_software = self.image_file.get_exif_by_entry('Software')[0][1] 
    self.take_date = self.image_file.get_exif_by_entry('DateTime')[0][1] 
    self.author = self.image_file.get_exif_by_entry('Artist')[0][1] 
    self.copyright = self.image_file.get_exif_by_entry('Copyright')[0][1] 
  end  

  #naprawia mime-types
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.image_file = data
    self.status = 0
  end
  
  #zatwierdza zdjecie
  def accept!
    self.status = 1
    self.save
  end
  
end
