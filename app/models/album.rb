class Album < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'photos' do
    image_storage_format :jpg
    preprocess_image do |image|
      image.resize '1000x1000'
    end
  end
  has_many   :photos
  belongs_to :parent, :class_name => "Album"
  has_many   :children, :class_name => "Album", :foreign_key => "parent_id"
  
  validates_presence_of :title, :message => "Wprowadź nazwę albumu"
  validates_presence_of :description, :message => "Wprowadź opis dla albumu"

  def top?
    if self.parent_id == 0
      return true
    else
      return false
    end
  end     

  def down?
    if self.children.size == 0
      return true
    else
      return false
    end
  end
  
  def tree_to_array(tree_array)
    self.children.each do |child|
      tree_array.push(child)
      child.tree_to_array(tree_array)
    end
    return tree_array
  end

  def parent_tree_to_array(tree_array)
    unless self.top?
      tree_array.push(self.parent)
      self.parent.parent_tree_to_array(tree_array)
    end
    return tree_array
  end


end
