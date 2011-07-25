class EmployeebankmastersController < ApplicationController
  # GET /employeebankmasters
  # GET /employeebankmasters.xml
  def index
    @employeebankmasters = Employeebankmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employeebankmasters }
    end
  end

  # GET /employeebankmasters/1
  # GET /employeebankmasters/1.xml
  def show
    @employeebankmaster = Employeebankmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employeebankmaster }
    end
  end

  # GET /employeebankmasters/new
  # GET /employeebankmasters/new.xml
  def new
    @employeebankmaster = Employeebankmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employeebankmaster }
    end
  end

  # GET /employeebankmasters/1/edit
  def edit
    @employeebankmaster = Employeebankmaster.find(params[:id])
  end

  # POST /employeebankmasters
  # POST /employeebankmasters.xml
  def create
    @employeebankmaster = Employeebankmaster.new(params[:employeebankmaster])

    respond_to do |format|
      if @employeebankmaster.save
        format.html { redirect_to(@employeebankmaster, :notice => 'Employeebankmaster was successfully created.') }
        format.xml  { render :xml => @employeebankmaster, :status => :created, :location => @employeebankmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employeebankmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employeebankmasters/1
  # PUT /employeebankmasters/1.xml
  def update
    @employeebankmaster = Employeebankmaster.find(params[:id])

    respond_to do |format|
      if @employeebankmaster.update_attributes(params[:employeebankmaster])
        format.html { redirect_to(@employeebankmaster, :notice => 'Employeebankmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employeebankmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employeebankmasters/1
  # DELETE /employeebankmasters/1.xml
  def destroy
    @employeebankmaster = Employeebankmaster.find(params[:id])
    @employeebankmaster.destroy

    respond_to do |format|
      format.html { redirect_to(employeebankmasters_url) }
      format.xml  { head :ok }
    end
  end
  def ajax_buildings
		
		n=params[:q]
		@ba=Bankmaster.find_by_code(n)
		render :text =>@ba.name+","+@ba.branch+","+@ba.city+","+@ba.address
		end
		
  
end
