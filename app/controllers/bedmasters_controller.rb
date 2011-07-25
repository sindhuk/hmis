class BedmastersController < ApplicationController
  # GET /bedmasters
  # GET /bedmasters.xml
  def index
    @bedmasters = Bedmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bedmasters }
    end
  end

  # GET /bedmasters/1
  # GET /bedmasters/1.xml
  def show
    @bedmaster = Bedmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bedmaster }
    end
  end

  # GET /bedmasters/new
  # GET /bedmasters/new.xml
  def new
    @bedmaster = Bedmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bedmaster }
    end
  end

  # GET /bedmasters/1/edit
  def edit
    @bedmaster = Bedmaster.find(params[:id])
  end

  # POST /bedmasters
  # POST /bedmasters.xml
  def create
	@bedmaster = Bedmaster.new(params[:bedmaster])

    respond_to do |format|
      if @bedmaster.save
        format.html { redirect_to(@bedmaster, :notice => 'Bedmaster was successfully created.') }
        format.xml  { render :xml => @bedmaster, :status => :created, :location => @bedmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bedmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bedmasters/1
  # PUT /bedmasters/1.xml
  def update
    @bedmaster = Bedmaster.find(params[:id])

    respond_to do |format|
      if @bedmaster.update_attributes(params[:bedmaster])
        format.html { redirect_to(@bedmaster, :notice => 'Bedmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bedmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bedmasters/1
  # DELETE /bedmasters/1.xml
  def destroy
    @bedmaster = Bedmaster.find(params[:id])
    @bedmaster.destroy

    respond_to do |format|
      format.html { redirect_to(bedmasters_url) }
      format.xml  { head :ok }
    end
  end
end
