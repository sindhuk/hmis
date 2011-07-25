class PeopleController < ApplicationController
    before_filter :ensure_login, :only => [:edit, :update]
	
 
  def index
    @people = Person.find(:all)
  end
 
  def show
    @person = Person.find(params[:id])
  end
 
  def new
    @person = Person.new
  end
 
  def create
    @person = Person.new(params[:person])
    profile=@person.profile
	respond_to do |format|
		if @person.save
			format.html { redirect_to(@person, :notice => 'User was successfully created.') }
			format.xml  { render :xml => @person, :status => :created, :location => @person }
		else
			render(:action => 'new')
    end
	end
  end
 
  def edit
    @person = Person.find(@user)
  end
 
  def update
    @person = Person.find(@user)
    if @person.update_attributes(params[:person])
      flash[:notice] = "Your account has been updated"
      redirect_to(root_url)
    else
      render(:action => 'edit')
    end
  end
 
  def destroy
	@person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end

end
