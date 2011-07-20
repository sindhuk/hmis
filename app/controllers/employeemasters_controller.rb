class EmployeemastersController < ApplicationController
  # GET /employeemasters
  # GET /employeemasters.xml
  def index
    @employeemasters = Employeemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employeemasters }
    end
  end

  # GET /employeemasters/1
  # GET /employeemasters/1.xml
  def show
    @employeemaster = Employeemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employeemaster }
    end
  end

  # GET /employeemasters/new
  # GET /employeemasters/new.xml
  def new
    @employeemaster = Employeemaster.new
	@designationmasters = Designationmaster.find(:all)
	@departmentmasters = Departmentmaster.find(:all)
	@citymasters = Citymaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employeemaster }
    end
  end

  # GET /employeemasters/1/edit
  def edit
    @employeemaster = Employeemaster.find(params[:id])
	@designationmasters = Designationmaster.find(:all)
	@departmentmasters = Departmentmaster.find(:all)
	@citymasters = Citymaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
	@statemasters = Statemaster.find(:all)
  end

  # POST /employeemasters
  # POST /employeemasters.xml
  def create
    @employeemaster = Employeemaster.new(params[:employeemaster])

    respond_to do |format|
      if @employeemaster.save
        format.html { redirect_to(@employeemaster, :notice => 'Employeemaster was successfully created.') }
        format.xml  { render :xml => @employeemaster, :status => :created, :location => @employeemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employeemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employeemasters/1
  # PUT /employeemasters/1.xml
  def update
    @employeemaster = Employeemaster.find(params[:id])

    respond_to do |format|
      if @employeemaster.update_attributes(params[:employeemaster])
        format.html { redirect_to(@employeemaster, :notice => 'Employeemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employeemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employeemasters/1
  # DELETE /employeemasters/1.xml
  def destroy
    @employeemaster = Employeemaster.find(params[:id])
    @employeemaster.destroy

    respond_to do |format|
      format.html { redirect_to(employeemasters_url) }
      format.xml  { head :ok }
    end
  end
 def ajax_buildings
	mr=params[:q]
	puts mr
	@city=Citymaster.find_by_name(mr)
	@state=Statemaster.find_by_id(@city.statemaster_id)
	@country=Countrymaster.find_by_id(@state.countrymaster_id)
	render :text => @state.name+","+@country.name
  end
  end



