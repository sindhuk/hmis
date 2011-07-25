class StockpointmastersController < ApplicationController
  # GET /stockpointmasters
  # GET /stockpointmasters.xml
  def index
    @stockpointmasters = Stockpointmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stockpointmasters }
    end
  end

  # GET /stockpointmasters/1
  # GET /stockpointmasters/1.xml
  def show
    @stockpointmaster = Stockpointmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stockpointmaster }
    end
  end

  # GET /stockpointmasters/new
  # GET /stockpointmasters/new.xml
  def new
    @stockpointmaster = Stockpointmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stockpointmaster }
    end
  end

  # GET /stockpointmasters/1/edit
  def edit
    @stockpointmaster = Stockpointmaster.find(params[:id])
  end

  # POST /stockpointmasters
  # POST /stockpointmasters.xml
  def create
    @stockpointmaster = Stockpointmaster.new(params[:stockpointmaster])

    respond_to do |format|
      if @stockpointmaster.save
        format.html { redirect_to(@stockpointmaster, :notice => 'Stockpointmaster was successfully created.') }
        format.xml  { render :xml => @stockpointmaster, :status => :created, :location => @stockpointmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stockpointmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stockpointmasters/1
  # PUT /stockpointmasters/1.xml
  def update
    @stockpointmaster = Stockpointmaster.find(params[:id])

    respond_to do |format|
      if @stockpointmaster.update_attributes(params[:stockpointmaster])
        format.html { redirect_to(@stockpointmaster, :notice => 'Stockpointmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stockpointmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stockpointmasters/1
  # DELETE /stockpointmasters/1.xml
  def destroy
    @stockpointmaster = Stockpointmaster.find(params[:id])
    @stockpointmaster.destroy

    respond_to do |format|
      format.html { redirect_to(stockpointmasters_url) }
      format.xml  { head :ok }
    end
  end
end
