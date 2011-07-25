class HospitalmastersController < ApplicationController
  # GET /hospitalmasters
  # GET /hospitalmasters.xml
   
  def index
    @hospitalmasters = Hospitalmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hospitalmasters }
    end
  end

  # GET /hospitalmasters/1
  # GET /hospitalmasters/1.xml
  def show
    @hospitalmaster = Hospitalmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hospitalmaster }
    end
  end

  # GET /hospitalmasters/new
  # GET /hospitalmasters/new.xml
  def new
    @hospitalmaster = Hospitalmaster.new
    @citymasters = Citymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hospitalmaster }
    end
  end

  # GET /hospitalmasters/1/edit
  def edit
    @hospitalmaster = Hospitalmaster.find(params[:id])
	@citymasters = Citymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
  end

  # POST /hospitalmasters
  # POST /hospitalmasters.xml
  def create
    @hospitalmaster = Hospitalmaster.new(params[:hospitalmaster])

    respond_to do |format|
      if @hospitalmaster.save
        format.html { redirect_to(@hospitalmaster, :notice => 'Hospitalmaster was successfully created.') }
        format.xml  { render :xml => @hospitalmaster, :status => :created, :location => @hospitalmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hospitalmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hospitalmasters/1
  # PUT /hospitalmasters/1.xml
  def update
    @hospitalmaster = Hospitalmaster.find(params[:id])

    respond_to do |format|
      if @hospitalmaster.update_attributes(params[:hospitalmaster])
        format.html { redirect_to(@hospitalmaster, :notice => 'Hospitalmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hospitalmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitalmasters/1
  # DELETE /hospitalmasters/1.xml
  def destroy
    @hospitalmaster = Hospitalmaster.find(params[:id])
    @hospitalmaster.destroy

    respond_to do |format|
      format.html { redirect_to(hospitalmasters_url) }
      format.xml  { head :ok }
    end
  end
  
  
 
  def upload
  uploaded_io = params[:hospitalmaster][:hospitallogo]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
    file.write(uploaded_io.read)
  end
   
  
end 
  
  def ajax_buildings
	mr=params[:q]
	@city=Citymaster.find_by_name(mr)
	@state=Statemaster.find_by_id(@city.state_id)
	@country=Countrymaster.find_by_id(@state.country_id)
	render :text =>@state.name+","+ @country.name
  end	
 end
