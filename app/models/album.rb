class Album < ActiveRecord::Base
  has_many :photos
  validates_presence_of :title, :message => "Wprowadź nazwę albumu"
  validates_presence_of :description, :message => "Wprowadź opis dla albumu"
end
