require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal ["Bestellung@berner-bikes.com"], mail.from
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(orders(:one))
    assert_equal ["Bestellung@berner-bikes.com"], mail.from
  end

end
