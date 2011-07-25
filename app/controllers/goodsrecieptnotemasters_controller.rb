class GoodsrecieptnotemastersController < ApplicationController
  # GET /goodsrecieptnotemasters
  # GET /goodsrecieptnotemasters.xml
  def index
    @goodsrecieptnotemasters = Goodsrecieptnotemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goodsrecieptnotemasters }
    end
  end

  # GET /goodsrecieptnotemasters/1
  # GET /goodsrecieptnotemasters/1.xml
  def show
    @goodsrecieptnotemaster = Goodsrecieptnotemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goodsrecieptnotemaster }
    end
  end

  # GET /goodsrecieptnotemasters/new
  # GET /goodsrecieptnotemasters/new.xml
  def new
    @goodsrecieptnotemaster = Goodsrecieptnotemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goodsrecieptnotemaster }
    end
  end

  # GET /goodsrecieptnotemasters/1/edit
  def edit
    @goodsrecieptnotemaster = Goodsrecieptnotemaster.find(params[:id])
  end

  # POST /goodsrecieptnotemasters
  # POST /goodsrecieptnotemasters.xml
  def create
    @goodsrecieptnotemaster = Goodsrecieptnotemaster.new(params[:goodsrecieptnotemaster])

    respond_to do |format|
      if @goodsrecieptnotemaster.save
        format.html { redirect_to(@goodsrecieptnotemaster, :notice => 'Goodsrecieptnotemaster was successfully created.') }
        format.xml  { render :xml => @goodsrecieptnotemaster, :status => :created, :location => @goodsrecieptnotemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goodsrecieptnotemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goodsrecieptnotemasters/1
  # PUT /goodsrecieptnotemasters/1.xml
  def update
    @goodsrecieptnotemaster = Goodsrecieptnotemaster.find(params[:id])

    respond_to do |format|
      if @goodsrecieptnotemaster.update_attributes(params[:goodsrecieptnotemaster])
        format.html { redirect_to(@goodsrecieptnotemaster, :notice => 'Goodsrecieptnotemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goodsrecieptnotemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goodsrecieptnotemasters/1
  # DELETE /goodsrecieptnotemasters/1.xml
  def destroy
    @goodsrecieptnotemaster = Goodsrecieptnotemaster.find(params[:id])
    @goodsrecieptnotemaster.destroy

    respond_to do |format|
      format.html { redirect_to(goodsrecieptnotemasters_url) }
      format.xml  { head :ok }
    end
  end
end
