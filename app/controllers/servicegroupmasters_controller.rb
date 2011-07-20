class ServicegroupmastersController < ApplicationController
  # GET /servicegroupmasters
  # GET /servicegroupmasters.xml
  def index
    @servicegroupmasters = Servicegroupmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @servicegroupmasters }
    end
  end

  # GET /servicegroupmasters/1
  # GET /servicegroupmasters/1.xml
  def show
    @servicegroupmaster = Servicegroupmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @servicegroupmaster }
    end
  end

  # GET /servicegroupmasters/new
  # GET /servicegroupmasters/new.xml
  def new
    @servicegroupmaster = Servicegroupmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @servicegroupmaster }
    end
  end

  # GET /servicegroupmasters/1/edit
  def edit
    @servicegroupmaster = Servicegroupmaster.find(params[:id])
  end

  # POST /servicegroupmasters
  # POST /servicegroupmasters.xml
  def create
    @servicegroupmaster = Servicegroupmaster.new(params[:servicegroupmaster])

    respond_to do |format|
      if @servicegroupmaster.save
        format.html { redirect_to(@servicegroupmaster, :notice => 'Servicegroupmaster was successfully created.') }
        format.xml  { render :xml => @servicegroupmaster, :status => :created, :location => @servicegroupmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @servicegroupmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /servicegroupmasters/1
  # PUT /servicegroupmasters/1.xml
  def update
    @servicegroupmaster = Servicegroupmaster.find(params[:id])

    respond_to do |format|
      if @servicegroupmaster.update_attributes(params[:servicegroupmaster])
        format.html { redirect_to(@servicegroupmaster, :notice => 'Servicegroupmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @servicegroupmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /servicegroupmasters/1
  # DELETE /servicegroupmasters/1.xml
  def destroy
    @servicegroupmaster = Servicegroupmaster.find(params[:id])
    @servicegroupmaster.destroy

    respond_to do |format|
      format.html { redirect_to(servicegroupmasters_url) }
      format.xml  { head :ok }
    end
  end
end
