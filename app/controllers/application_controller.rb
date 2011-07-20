# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
   helper :all # include all helpers, all the time
   before_filter :maintain_session_and_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def ensure_login
    unless @user
      
      redirect_to(new_session_path)
    end
  end
  
  def ensure_logout
    if @user
      
      redirect_to("http://localhost:3000/sessions")
    end
  end
  
  private
  
  def maintain_session_and_user
    if session[:id]
      if @application_session = Session.find_by_id(session[:id])
        @application_session.update_attributes(
          :ip_address => request.remote_addr,
          :path => request.path_info
        )
        @user = @application_session.person
      else
        session[:id] = nil
        redirect_to(root_url)
      end
    end
  end
end
