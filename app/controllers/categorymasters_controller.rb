class CategorymastersController < ApplicationController
  # GET /categorymasters
  # GET /categorymasters.xml
  def index
    @categorymasters = Categorymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categorymasters }
    end
  end

  # GET /categorymasters/1
  # GET /categorymasters/1.xml
  def show
    @categorymaster = Categorymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @categorymaster }
    end
  end

  # GET /categorymasters/new
  # GET /categorymasters/new.xml
  def new
    @categorymaster = Categorymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categorymaster }
    end
  end

  # GET /categorymasters/1/edit
  def edit
    @categorymaster = Categorymaster.find(params[:id])
  end

  # POST /categorymasters
  # POST /categorymasters.xml
  def create
    @categorymaster = Categorymaster.new(params[:categorymaster])

    respond_to do |format|
      if @categorymaster.save
        format.html { redirect_to(@categorymaster, :notice => 'Categorymaster was successfully created.') }
        format.xml  { render :xml => @categorymaster, :status => :created, :location => @categorymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @categorymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categorymasters/1
  # PUT /categorymasters/1.xml
  def update
    @categorymaster = Categorymaster.find(params[:id])

    respond_to do |format|
      if @categorymaster.update_attributes(params[:categorymaster])
        format.html { redirect_to(@categorymaster, :notice => 'Categorymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categorymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categorymasters/1
  # DELETE /categorymasters/1.xml
  def destroy
    @categorymaster = Categorymaster.find(params[:id])
    @categorymaster.destroy

    respond_to do |format|
      format.html { redirect_to(categorymasters_url) }
      format.xml  { head :ok }
    end
  end
end
