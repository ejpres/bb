class Product < ActiveRecord::Base
  attr_accessible :name, :description, :sku, :image, :price, :category_id
  
  validates :name, :price, :sku, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.1 } 
  
  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :image, ImageUploader

  private
  	#ensure that there are no line items referencing this product
  	def ensure_not_referenced_by_any_line_item
  	  if line_items.empty?
  	  	return true
  	  else
  	  	errors.add(:base, 'Line items present')
  	  	return false
  	  end
  	end
end