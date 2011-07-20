class StatemastersController < ApplicationController
  # GET /statemasters
  # GET /statemasters.xml
  def index
    @statemasters = Statemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statemasters }
    end
  end

  # GET /statemasters/1
  # GET /statemasters/1.xml
  def show
    @statemaster = Statemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @statemaster }
    end
  end

  # GET /statemasters/new
  # GET /statemasters/new.xml
  def new
    @statemaster = Statemaster.new
    @countrymasters = Countrymaster.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @statemaster }
    end
  end

  # GET /statemasters/1/edit
  def edit
    @statemaster = Statemaster.find(params[:id])
	@countrymasters = Countrymaster.find(:all)
  end

  # POST /statemasters
  # POST /statemasters.xml
  def create
    @statemaster = Statemaster.new(params[:statemaster])
	@country=Countrymaster.find_by_name(@statemaster.country_name)
	@statemaster.countrymaster_id=@country.id
    respond_to do |format|
      if @statemaster.save
        format.html { redirect_to(@statemaster, :notice => 'Statemaster was successfully created.') }
        format.xml  { render :xml => @statemaster, :status => :created, :location => @statemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @statemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statemasters/1
  # PUT /statemasters/1.xml
  def update
    @statemaster = Statemaster.find(params[:id])

    respond_to do |format|
      if @statemaster.update_attributes(params[:statemaster])
        format.html { redirect_to(@statemaster, :notice => 'Statemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @statemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statemasters/1
  # DELETE /statemasters/1.xml
  def destroy
    @statemaster = Statemaster.find(params[:id])
    @statemaster.destroy

    respond_to do |format|
      format.html { redirect_to(statemasters_url) }
      format.xml  { head :ok }
    end
  end
end
