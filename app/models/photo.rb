class Photo < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'public/images/photos'
  belongs_to :album
  
  named_scope :accepted, :conditions => { :status => 1 }
  named_scope :waiting, :conditions => { :status => 0 }

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
