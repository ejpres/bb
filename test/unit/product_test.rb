require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "adding a valid product" do
  	assert products(:one).valid?
  end

  test "adding an invalid product" do
    product = products(:invalid)
  	assert product.invalid?
  	assert product.invalid?(:name)
  	assert product.invalid?(:description)
  	assert product.invalid?(:sku)
  	assert product.invalid?(:image)
  	assert product.invalid?(:price), "preis"
  	assert product.invalid?(:category_id)
  end

  test "add product with zero price" do
  	product = products(:zero_price)
  	assert product.invalid?(:price), "preis"
  end

  test "add product with letter price" do
  	product = products(:letter_price)
  	assert product.invalid?(:price), "preis"
  end
end