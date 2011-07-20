class BankmastersController < ApplicationController
  # GET /bankmasters
  # GET /bankmasters.xml
  def index
    @bankmasters = Bankmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bankmasters }
    end
  end

  # GET /bankmasters/1
  # GET /bankmasters/1.xml
  def show
    @bankmaster = Bankmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bankmaster }
    end
  end

  # GET /bankmasters/new
  # GET /bankmasters/new.xml
  def new
    @bankmaster = Bankmaster.new
    @citymasters = Citymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bankmaster }
    end
  end

  # GET /bankmasters/1/edit
  def edit
    @bankmaster = Bankmaster.find(params[:id])
	@citymasters = Citymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
	
  end

  # POST /bankmasters
  # POST /bankmasters.xml
  def create
    @bankmaster = Bankmaster.new(params[:bankmaster])

    respond_to do |format|
      if @bankmaster.save
        format.html { redirect_to(@bankmaster, :notice => 'Bankmaster was successfully created.') }
        format.xml  { render :xml => @bankmaster, :status => :created, :location => @bankmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bankmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bankmasters/1
  # PUT /bankmasters/1.xml
  def update
    @bankmaster = Bankmaster.find(params[:id])

    respond_to do |format|
      if @bankmaster.update_attributes(params[:bankmaster])
        format.html { redirect_to(@bankmaster, :notice => 'Bankmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bankmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bankmasters/1
  # DELETE /bankmasters/1.xml
  def destroy
    @bankmaster = Bankmaster.find(params[:id])
    @bankmaster.destroy

    respond_to do |format|
      format.html { redirect_to(bankmasters_url) }
      format.xml  { head :ok }
    end
  end
  def ajax_buildings
	mr=params[:q]
	@city=Citymaster.find_by_name(mr)
	@state=Statemaster.find_by_id(@city.statemaster_id)
	@country=Countrymaster.find_by_id(@state.countrymaster_id)
	render :text => @country.name+","+@state.name
  end	
end
