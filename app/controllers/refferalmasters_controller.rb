class RefferalmastersController < ApplicationController
  # GET /refferalmasters
  # GET /refferalmasters.xml
  def index
    @refferalmasters = Refferalmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @refferalmasters }
    end
  end

  # GET /refferalmasters/1
  # GET /refferalmasters/1.xml
  def show
    @refferalmaster = Refferalmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @refferalmaster }
    end
  end

  # GET /refferalmasters/new
  # GET /refferalmasters/new.xml
  def new
    @refferalmaster = Refferalmaster.new
	@citymasters = Citymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @refferalmaster }
	      end
  end

  # GET /refferalmasters/1/edit
  def edit
    @refferalmaster = Refferalmaster.find(params[:id])
	@citymasters = Citymaster.find(:all)
	@statemasters = Statemaster.find(:all)
	@countrymasters = Countrymaster.find(:all)
  
  end

  # POST /refferalmasters
  # POST /refferalmasters.xml
  def create
    @refferalmaster = Refferalmaster.new(params[:refferalmaster])

    respond_to do |format|
      if @refferalmaster.save
        format.html { redirect_to(@refferalmaster, :notice => 'Refferalmaster was successfully created.') }
        format.xml  { render :xml => @refferalmaster, :status => :created, :location => @refferalmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @refferalmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /refferalmasters/1
  # PUT /refferalmasters/1.xml
  def update
    @refferalmaster = Refferalmaster.find(params[:id])

    respond_to do |format|
      if @refferalmaster.update_attributes(params[:refferalmaster])
        format.html { redirect_to(@refferalmaster, :notice => 'Refferalmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @refferalmaster.errors, :status => :unprocessable_entity }
      end
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

  # DELETE /refferalmasters/1
  # DELETE /refferalmasters/1.xml
  def destroy
    @refferalmaster = Refferalmaster.find(params[:id])
    @refferalmaster.destroy

    respond_to do |format|
      format.html { redirect_to(refferalmasters_url) }
      format.xml  { head :ok }
    end
  end
end
