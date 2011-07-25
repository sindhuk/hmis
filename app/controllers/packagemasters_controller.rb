class PackagemastersController < ApplicationController
  # GET /packagemasters
  # GET /packagemasters.xml
  def index
    @packagemasters = Packagemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @packagemasters }
    end
  end

  # GET /packagemasters/1
  # GET /packagemasters/1.xml
  def show
    @packagemaster = Packagemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @packagemaster }
    end
  end

  # GET /packagemasters/new
  # GET /packagemasters/new.xml
  def new
    @packagemaster = Packagemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @packagemaster }
    end
  end

  # GET /packagemasters/1/edit
  def edit
    @packagemaster = Packagemaster.find(params[:id])
  end

  # POST /packagemasters
  # POST /packagemasters.xml
  def create
    @packagemaster = Packagemaster.new(params[:packagemaster])

    respond_to do |format|
      if @packagemaster.save
        format.html { redirect_to(@packagemaster, :notice => 'Packagemaster was successfully created.') }
        format.xml  { render :xml => @packagemaster, :status => :created, :location => @packagemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @packagemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /packagemasters/1
  # PUT /packagemasters/1.xml
  def update
    @packagemaster = Packagemaster.find(params[:id])

    respond_to do |format|
      if @packagemaster.update_attributes(params[:packagemaster])
        format.html { redirect_to(@packagemaster, :notice => 'Packagemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @packagemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /packagemasters/1
  # DELETE /packagemasters/1.xml
  def destroy
    @packagemaster = Packagemaster.find(params[:id])
    @packagemaster.destroy

    respond_to do |format|
      format.html { redirect_to(packagemasters_url) }
      format.xml  { head :ok }
    end
  end
end
