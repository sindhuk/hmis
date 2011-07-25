class CitymastersController < ApplicationController
  # GET /citymasters
  # GET /citymasters.xml
  def index
    @citymasters = Citymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @citymasters }
    end
  end

  # GET /citymasters/1
  # GET /citymasters/1.xml
  def show
    @citymaster = Citymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @citymaster }
    end
  end

  # GET /citymasters/new
  # GET /citymasters/new.xml
  def new
    @citymaster = Citymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @citymaster }
    end
  end

  # GET /citymasters/1/edit
  def edit
    @citymaster = Citymaster.find(params[:id])
  end

  # POST /citymasters
  # POST /citymasters.xml
  def create
    @citymaster = Citymaster.new(params[:citymaster])
	@state=Statemaster.find_by_name(@citymaster.state_name)
	@citymaster.statemaster_id=@state.id
    respond_to do |format|
      if @citymaster.save
        format.html { redirect_to(@citymaster, :notice => 'Citymaster was successfully created.') }
        format.xml  { render :xml => @citymaster, :status => :created, :location => @citymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @citymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /citymasters/1
  # PUT /citymasters/1.xml
  def update
    @citymaster = Citymaster.find(params[:id])

    respond_to do |format|
      if @citymaster.update_attributes(params[:citymaster])
        format.html { redirect_to(@citymaster, :notice => 'Citymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @citymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /citymasters/1
  # DELETE /citymasters/1.xml
  def destroy
    @citymaster = Citymaster.find(params[:id])
    @citymaster.destroy

    respond_to do |format|
      format.html { redirect_to(citymasters_url) }
      format.xml  { head :ok }
    end
  end
  
end
