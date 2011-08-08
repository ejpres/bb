class UsersController < ApplicationController
    skip_before_filter :authorize, :only => [:new, :create]


  def index
    @users = User.paginate :page=>params[:page], 
                           :order=>'created_at desc', 
                           :per_page => 10
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @users }
    end
  end

  def new
  	@user = User.new
    @cart = current_cart
  end

  def update
    @user = User.find(params[:user])
    @cart = current_cart

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(users_url, 
          :notice => "Benutzerdaten wurden erfolgreich bearbeitet")}
        format.json { render json: @users }
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @users.errors, :status => :unprocessable_entity }
      end
    end
  end


  def create
  	@user = User.new(params[:user])
    @cart = current_cart

  	if @user.save
  	  redirect_to root_url, :notice => "Danke, dass Sie Sich registriert haben."
  	else
  	  render "new"
  	end
  end
end
