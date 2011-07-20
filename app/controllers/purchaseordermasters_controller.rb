class PurchaseordermastersController < ApplicationController
  # GET /purchaseordermasters
  # GET /purchaseordermasters.xml
  def index
    @purchaseordermasters = Purchaseordermaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchaseordermasters }
    end
  end

  # GET /purchaseordermasters/1
  # GET /purchaseordermasters/1.xml
  def show
    @purchaseordermaster = Purchaseordermaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchaseordermaster }
    end
  end

  # GET /purchaseordermasters/new
  # GET /purchaseordermasters/new.xml
  def new
    @purchaseordermaster = Purchaseordermaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchaseordermaster }
    end
  end

  # GET /purchaseordermasters/1/edit
  def edit
    @purchaseordermaster = Purchaseordermaster.find(params[:id])
  end

  # POST /purchaseordermasters
  # POST /purchaseordermasters.xml
  def create
    @purchaseordermaster = Purchaseordermaster.new(params[:purchaseordermaster])

    respond_to do |format|
      if @purchaseordermaster.save
        format.html { redirect_to(@purchaseordermaster, :notice => 'Purchaseordermaster was successfully created.') }
        format.xml  { render :xml => @purchaseordermaster, :status => :created, :location => @purchaseordermaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchaseordermaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchaseordermasters/1
  # PUT /purchaseordermasters/1.xml
  def update
    @purchaseordermaster = Purchaseordermaster.find(params[:id])

    respond_to do |format|
      if @purchaseordermaster.update_attributes(params[:purchaseordermaster])
        format.html { redirect_to(@purchaseordermaster, :notice => 'Purchaseordermaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchaseordermaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchaseordermasters/1
  # DELETE /purchaseordermasters/1.xml
  def destroy
    @purchaseordermaster = Purchaseordermaster.find(params[:id])
    @purchaseordermaster.destroy

    respond_to do |format|
      format.html { redirect_to(purchaseordermasters_url) }
      format.xml  { head :ok }
    end
  end
end
