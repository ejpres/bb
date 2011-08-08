class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
    @cart = current_cart

    respond_to do |format|
      format.html # new.html.haml
      format.js
      format.json { render json: @session }
    end
  end

  def create
  	user = User.find_by_email(params[:email])
  	@cart = current_cart

  	if user && user.authenticate(params[:password])
  	  session[:user_id] = user.id
  	  redirect_to root_url, :notice => "Sie sind angemeldet"
  	else
      redirect_to root_path, :remote => true, :notice => "Email oder Passwort falsch!"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Sie sind abgemeldet"
  end

end
