class HomeController < ApplicationController
  def home
	@master= Master.all
  end
  def user_home
	
  end
  def admin
	v=Verify.new
	@user_name=v.name
	@master= Master.all
  end
  def user
	v=Verify.new
	@user_name=v.name
  end
  def header
	
  end
  def footer
	
  end
  def OP_Front
	
  end
  def IP_Front
	
  end
  def nurse
	
  end
  def tab
	@master= Master.all
  end
  def left
  end
end
