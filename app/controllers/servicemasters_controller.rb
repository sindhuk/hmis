class ServicemastersController < ApplicationController
  # GET /servicemasters
  # GET /servicemasters.xml
  def index
    @servicemasters = Servicemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @servicemasters }
    end
  end

  # GET /servicemasters/1
  # GET /servicemasters/1.xml
  def show
    @servicemaster = Servicemaster.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @servicemaster }
    end
  end

  # GET /servicemasters/new
  # GET /servicemasters/new.xml
  def new
    @servicemaster = Servicemaster.new
    @servicegroupmaster = Servicegroupmaster.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @servicemaster }
    end
  end

  # GET /servicemasters/1/edit
  def edit
    @servicemaster = Servicemaster.find(params[:id])
	@servicegroupmaster = Servicegroupmaster.find(:all)
  end

  # POST /servicemasters
  # POST /servicemasters.xml
  def create
    @servicemaster = Servicemaster.new(params[:servicemaster])

    respond_to do |format|
      if @servicemaster.save
        format.html { redirect_to(@servicemaster, :notice => 'Servicemaster was successfully created.') }
        format.xml  { render :xml => @servicemaster, :status => :created, :location => @servicemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @servicemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /servicemasters/1
  # PUT /servicemasters/1.xml
  def update
    @servicemaster = Servicemaster.find(params[:id])

    respond_to do |format|
      if @servicemaster.update_attributes(params[:servicemaster])
        format.html { redirect_to(@servicemaster, :notice => 'Servicemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @servicemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /servicemasters/1
  # DELETE /servicemasters/1.xml
  def destroy
    @servicemaster = Servicemaster.find(params[:id])
    @servicemaster.destroy

    respond_to do |format|
      format.html { redirect_to(servicemasters_url) }
      format.xml  { head :ok }
    end
  end
end
