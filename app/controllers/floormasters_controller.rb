class FloormastersController < ApplicationController
  # GET /floormasters
  # GET /floormasters.xml
  def index
    @floormasters = Floormaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @floormasters }
    end
  end

  # GET /floormasters/1
  # GET /floormasters/1.xml
  def show
    @floormaster = Floormaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @floormaster }
    end
  end

  # GET /floormasters/new
  # GET /floormasters/new.xml
  def new
    @floormaster = Floormaster.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @floormaster }
    end
  end

  # GET /floormasters/1/edit
  def edit
    @floormaster = Floormaster.find(params[:id])
  end

  # POST /floormasters
  # POST /floormasters.xml
  def create
    @floormaster = Floormaster.new(params[:floormaster])

    respond_to do |format|
      if @floormaster.save
        format.html { redirect_to(@floormaster, :notice => 'Floormaster was successfully created.') }
        format.xml  { render :xml => @floormaster, :status => :created, :location => @floormaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @floormaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /floormasters/1
  # PUT /floormasters/1.xml
  def update
    @floormaster = Floormaster.find(params[:id])

    respond_to do |format|
      if @floormaster.update_attributes(params[:floormaster])
        format.html { redirect_to(@floormaster, :notice => 'Floormaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @floormaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /floormasters/1
  # DELETE /floormasters/1.xml
  def destroy
    @floormaster = Floormaster.find(params[:id])
    @floormaster.destroy

    respond_to do |format|
      format.html { redirect_to(floormasters_url) }
      format.xml  { head :ok }
    end
  end
  
end
