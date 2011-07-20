class DoctormastersController < ApplicationController
  # GET /doctormasters
  # GET /doctormasters.xml
  def index
    @doctormasters = Doctormaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctormasters }
    end
  end

  # GET /doctormasters/1
  # GET /doctormasters/1.xml
  def show
    @doctormaster = Doctormaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctormaster }
    end
  end

  # GET /doctormasters/new
  # GET /doctormasters/new.xml
  def new
    @doctormaster = Doctormaster.new
	@designationmaster= Designationmaster.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctormaster }
    end
  end

  # GET /doctormasters/1/edit
  def edit
    @doctormaster = Doctormaster.find(params[:id])
	@designationmaster= Designationmaster.find(:all)
  end

  # POST /doctormasters
  # POST /doctormasters.xml
  def create
    @doctormaster = Doctormaster.new(params[:doctormaster])

    respond_to do |format|
      if @doctormaster.save
        format.html { redirect_to(@doctormaster, :notice => 'Doctormaster was successfully created.') }
        format.xml  { render :xml => @doctormaster, :status => :created, :location => @doctormaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctormaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctormasters/1
  # PUT /doctormasters/1.xml
  def update
    @doctormaster = Doctormaster.find(params[:id])

    respond_to do |format|
      if @doctormaster.update_attributes(params[:doctormaster])
        format.html { redirect_to(@doctormaster, :notice => 'Doctormaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctormaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctormasters/1
  # DELETE /doctormasters/1.xml
  def destroy
    @doctormaster = Doctormaster.find(params[:id])
    @doctormaster.destroy

    respond_to do |format|
      format.html { redirect_to(doctormasters_url) }
      format.xml  { head :ok }
    end
  end
  
  def ajax_buildings
	mr=params[:q]
	@city=Citymaster.find_by_name(mr)
	@state=Statemaster.find_by_id(@city.state_id)
	@country=Countrymaster.find_by_id(@state.country_id)
	render :text => @country.cname+","+@state.sname
  end	
end
