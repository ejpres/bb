class Category < ActiveRecord::Base
	attr_accessible :name, :subcategory

	has_many :products

	def NameWithSubcategory
		#later
	end
end
