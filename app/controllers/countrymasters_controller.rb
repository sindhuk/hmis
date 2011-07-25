class CountrymastersController < ApplicationController
  # GET /countrymasters
  # GET /countrymasters.xml
  def index
    @countrymasters = Countrymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countrymasters }
    end
  end

  # GET /countrymasters/1
  # GET /countrymasters/1.xml
  def show
    @countrymaster = Countrymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @countrymaster }
    end
  end

  # GET /countrymasters/new
  # GET /countrymasters/new.xml
  def new
    @countrymaster = Countrymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @countrymaster }
    end
  end

  # GET /countrymasters/1/edit
  def edit
    @countrymaster = Countrymaster.find(params[:id])
  end

  # POST /countrymasters
  # POST /countrymasters.xml
  def create
    @countrymaster = Countrymaster.new(params[:countrymaster])

    respond_to do |format|
      if @countrymaster.save
        format.html { redirect_to(@countrymaster, :notice => 'Countrymaster was successfully created.') }
        format.xml  { render :xml => @countrymaster, :status => :created, :location => @countrymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @countrymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countrymasters/1
  # PUT /countrymasters/1.xml
  def update
    @countrymaster = Countrymaster.find(params[:id])

    respond_to do |format|
      if @countrymaster.update_attributes(params[:countrymaster])
        format.html { redirect_to(@countrymaster, :notice => 'Countrymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @countrymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /countrymasters/1
  # DELETE /countrymasters/1.xml
  def destroy
    @countrymaster = Countrymaster.find(params[:id])
    @countrymaster.destroy

    respond_to do |format|
      format.html { redirect_to(countrymasters_url) }
      format.xml  { head :ok }
    end
  end
end
