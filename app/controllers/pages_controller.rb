class PagesController < ApplicationController
  skip_before_filter :authorize


  def home
    @slides = Slide.all
    @cart = current_cart
  end

  def contact
  end
end
