class VendormastersController < ApplicationController
  # GET /vendormasters
  # GET /vendormasters.xml
  def index
    @vendormasters = Vendormaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vendormasters }
    end
  end

  # GET /vendormasters/1
  # GET /vendormasters/1.xml
  def show
    @vendormaster = Vendormaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vendormaster }
    end
  end

  # GET /vendormasters/new
  # GET /vendormasters/new.xml
  def new
    @vendormaster = Vendormaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vendormaster }
    end
  end

  # GET /vendormasters/1/edit
  def edit
    @vendormaster = Vendormaster.find(params[:id])
  end

  # POST /vendormasters
  # POST /vendormasters.xml
  def create
    @vendormaster = Vendormaster.new(params[:vendormaster])

    respond_to do |format|
      if @vendormaster.save
        format.html { redirect_to(@vendormaster, :notice => 'Vendormaster was successfully created.') }
        format.xml  { render :xml => @vendormaster, :status => :created, :location => @vendormaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vendormaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vendormasters/1
  # PUT /vendormasters/1.xml
  def update
    @vendormaster = Vendormaster.find(params[:id])

    respond_to do |format|
      if @vendormaster.update_attributes(params[:vendormaster])
        format.html { redirect_to(@vendormaster, :notice => 'Vendormaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vendormaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vendormasters/1
  # DELETE /vendormasters/1.xml
  def destroy
    @vendormaster = Vendormaster.find(params[:id])
    @vendormaster.destroy

    respond_to do |format|
      format.html { redirect_to(vendormasters_url) }
      format.xml  { head :ok }
    end
  end
end
