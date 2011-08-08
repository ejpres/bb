require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products




  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    bike = products(:ruby)

    get "/"
    assert_response :success
    assert_template "home"

    get "/rahmen"
    assert_response :success
    assert_template "show"

    xml_http_request :post, '/line_items', :product_id => bike.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal bike, cart.line_items[0].product

    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders",
    	:order => { :name	=> 	"Eric Nordmeyer",
    				:street	=> 	"Sonnenstr. 214",
    				:city	=> 	"Dortmund",
    				:zip    =>	44444,
    				:country	=>	"Deutschland",
    				:email	=>	"eric@nordmeyer.name",
    				:pay_type	=>	"Vorkasse"	}
    assert_response :success
    assert_template "home"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "Eric Nordmeyer", order.name
    assert_equal "Sonnenstr. 214", order.street
    assert_equal "Dortmund", order.city
    assert_equal 44444, order.zip
    assert_equal "Deutschland", order.country
    assert_equal "eric@nordmeyer.name", order.email
    assert_equal "Vorkasse", order.pay_type

    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal bike, line_item.product

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["eric@nordmeyer.name"], mail.to
    assert_equal 'Bestellung@berner-bikes.com', mail[:from].value
    assert_equal "BERNER-Bikes.com Bestellbestaetigung", mail.subject
  end
end
