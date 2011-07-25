class SessionsController < ApplicationController
       before_filter :ensure_login, :only => :destroy
  before_filter :ensure_logout, :only => [:new, :create]
 
  def index
    redirect_to(new_session_path)
  end
 
  def new
    @session = Session.new
  end
 
  def create
    @session = Session.new(params[:session])
	 v=Verify.new
	 v.store(@session.name)
	 profile=v.profile_value()
    if @session.save
      session[:id] = @session.id
	  if profile=="Admin"
		redirect_to("http://localhost:3000/home/admin")
      else
		redirect_to("http://localhost:3000/home/user")
	  end
    else
      render(:action => 'new')
    end
  end
 
  def destroy
    Session.destroy(@application_session)
    session[:id] = @user = nil
    flash[:notice] = "You are now logged out"
    redirect_to(root_url)
  end


end
