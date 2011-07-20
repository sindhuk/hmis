class OpeningstockentrymastersController < ApplicationController
  # GET /openingstockentrymasters
  # GET /openingstockentrymasters.xml
  def index
    @openingstockentrymasters = Openingstockentrymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @openingstockentrymasters }
    end
  end

  # GET /openingstockentrymasters/1
  # GET /openingstockentrymasters/1.xml
  def show
    @openingstockentrymaster = Openingstockentrymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @openingstockentrymaster }
    end
  end

  # GET /openingstockentrymasters/new
  # GET /openingstockentrymasters/new.xml
  def new
    @openingstockentrymaster = Openingstockentrymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @openingstockentrymaster }
    end
  end

  # GET /openingstockentrymasters/1/edit
  def edit
    @openingstockentrymaster = Openingstockentrymaster.find(params[:id])
  end

  # POST /openingstockentrymasters
  # POST /openingstockentrymasters.xml
  def create
    @openingstockentrymaster = Openingstockentrymaster.new(params[:openingstockentrymaster])

    respond_to do |format|
      if @openingstockentrymaster.save
        format.html { redirect_to(@openingstockentrymaster, :notice => 'Openingstockentrymaster was successfully created.') }
        format.xml  { render :xml => @openingstockentrymaster, :status => :created, :location => @openingstockentrymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @openingstockentrymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /openingstockentrymasters/1
  # PUT /openingstockentrymasters/1.xml
  def update
    @openingstockentrymaster = Openingstockentrymaster.find(params[:id])

    respond_to do |format|
      if @openingstockentrymaster.update_attributes(params[:openingstockentrymaster])
        format.html { redirect_to(@openingstockentrymaster, :notice => 'Openingstockentrymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @openingstockentrymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /openingstockentrymasters/1
  # DELETE /openingstockentrymasters/1.xml
  def destroy
    @openingstockentrymaster = Openingstockentrymaster.find(params[:id])
    @openingstockentrymaster.destroy

    respond_to do |format|
      format.html { redirect_to(openingstockentrymasters_url) }
      format.xml  { head :ok }
    end
  end
end
