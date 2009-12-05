module PhotosHelper

  def count_waiting_photos
    return Photo.waiting.size
  end
  
end