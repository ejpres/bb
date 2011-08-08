class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	belongs_to :order

	default_scope :order => 'updated_at DESC' 

	def total_price
		product.price * quantity
	end
end
