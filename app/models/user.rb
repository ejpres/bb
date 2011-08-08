class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation

  validates_presence_of :password, :email, :on => :create
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i }

end
