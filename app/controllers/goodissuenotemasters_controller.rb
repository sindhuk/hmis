class GoodissuenotemastersController < ApplicationController
  # GET /goodissuenotemasters
  # GET /goodissuenotemasters.xml
  def index
    @goodissuenotemasters = Goodissuenotemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goodissuenotemasters }
    end
  end

  # GET /goodissuenotemasters/1
  # GET /goodissuenotemasters/1.xml
  def show
    @goodissuenotemaster = Goodissuenotemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goodissuenotemaster }
    end
  end

  # GET /goodissuenotemasters/new
  # GET /goodissuenotemasters/new.xml
  def new
    @goodissuenotemaster = Goodissuenotemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goodissuenotemaster }
    end
  end

  # GET /goodissuenotemasters/1/edit
  def edit
    @goodissuenotemaster = Goodissuenotemaster.find(params[:id])
  end

  # POST /goodissuenotemasters
  # POST /goodissuenotemasters.xml
  def create
    @goodissuenotemaster = Goodissuenotemaster.new(params[:goodissuenotemaster])

    respond_to do |format|
      if @goodissuenotemaster.save
        format.html { redirect_to(@goodissuenotemaster, :notice => 'Goodissuenotemaster was successfully created.') }
        format.xml  { render :xml => @goodissuenotemaster, :status => :created, :location => @goodissuenotemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goodissuenotemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goodissuenotemasters/1
  # PUT /goodissuenotemasters/1.xml
  def update
    @goodissuenotemaster = Goodissuenotemaster.find(params[:id])

    respond_to do |format|
      if @goodissuenotemaster.update_attributes(params[:goodissuenotemaster])
        format.html { redirect_to(@goodissuenotemaster, :notice => 'Goodissuenotemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goodissuenotemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goodissuenotemasters/1
  # DELETE /goodissuenotemasters/1.xml
  def destroy
    @goodissuenotemaster = Goodissuenotemaster.find(params[:id])
    @goodissuenotemaster.destroy

    respond_to do |format|
      format.html { redirect_to(goodissuenotemasters_url) }
      format.xml  { head :ok }
    end
  end
end
