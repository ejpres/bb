class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  PAYMENT_TYPES = ["Vorkasse", "Nachnahme"]
  COUNTRIES = ["Deutschland", "Schweiz", "Oesterreich", "USA"]
  
  attr_accessible :name, :street, :zip, :city, :country, :email, :pay_type

  validates :name, :street, :zip, :city, :country, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :country, :inclusion => COUNTRIES
  validates_length_of :zip, :is => 5
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i }


  
  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end
  end
end
