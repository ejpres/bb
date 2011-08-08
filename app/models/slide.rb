class Slide < ActiveRecord::Base
  attr_accessible :title, :subtitle, :image
  validates :image, :presence => true
  
  mount_uploader :image, ImageUploader
end
