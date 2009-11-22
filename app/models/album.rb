class Album < ActiveRecord::Base
  has_many :photos
  validates_presence_of :title, :message => "Podaj tytuł"
end
