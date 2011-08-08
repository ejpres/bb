class Notifier < ActionMailer::Base
  default :from => "Bestellung@berner-bikes.com"
  

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_recieved.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, :subject => 'BERNER-Bikes.com Bestellbestaetigung'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail to: order.email, :subject => 'BERNER-Bikes.com Versandbenachrichtigung'
  end
    
  def protect_against_forgery?
    false
  end
end
