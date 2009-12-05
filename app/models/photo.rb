class Photo < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'photos' do
    image_storage_format :jpg
    preprocess_image do |image|
      image.resize '1600x1600'
    end
  end  
  belongs_to :album
  has_many :comments
  
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
  
  def status_text
    if self.status == 1
      return "zatwierdzone"
    else
      return "do akceptacji"
    end   
  end

  def next
    return Photo.find(:all, :conditions => ["album_id = ? AND id > ? AND status = 1", self.album_id, self.id]).first
  end

  def prev
    return Photo.find(:all, :conditions => ["album_id = ? AND id < ? AND status = 1", self.album_id, self.id]).last
  end

end
