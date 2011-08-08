require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  # This user should be valid by construction.
  def test_user_validity
    assert orders(:one).valid?
  end

  # This user should be invalid by construction.
  def test_user_invalidity
    order = orders(:invalid)
    assert !order.valid?
    assert order.invalid?(:name)
    assert order.invalid?(:street)
    assert order.invalid?(:zip)
    assert order.invalid?(:city)
    assert order.invalid?(:country)
    assert order.invalid?(:email)
    assert order.invalid?(:pay_type)
  end
end
