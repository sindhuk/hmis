class HolidaymastersController < ApplicationController
  # GET /holidaymasters
  # GET /holidaymasters.xml
  def index
    @holidaymasters = Holidaymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @holidaymasters }
    end
  end

  # GET /holidaymasters/1
  # GET /holidaymasters/1.xml
  def show
    @holidaymaster = Holidaymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @holidaymaster }
    end
  end

  # GET /holidaymasters/new
  # GET /holidaymasters/new.xml
  def new
    @holidaymaster = Holidaymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @holidaymaster }
    end
  end

  # GET /holidaymasters/1/edit
  def edit
    @holidaymaster = Holidaymaster.find(params[:id])
  end

  # POST /holidaymasters
  # POST /holidaymasters.xml
  def create
    @holidaymaster = Holidaymaster.new(params[:holidaymaster])

    respond_to do |format|
      if @holidaymaster.save
        format.html { redirect_to(@holidaymaster, :notice => 'Holidaymaster was successfully created.') }
        format.xml  { render :xml => @holidaymaster, :status => :created, :location => @holidaymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @holidaymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /holidaymasters/1
  # PUT /holidaymasters/1.xml
  def update
    @holidaymaster = Holidaymaster.find(params[:id])

    respond_to do |format|
      if @holidaymaster.update_attributes(params[:holidaymaster])
        format.html { redirect_to(@holidaymaster, :notice => 'Holidaymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @holidaymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /holidaymasters/1
  # DELETE /holidaymasters/1.xml
  def destroy
    @holidaymaster = Holidaymaster.find(params[:id])
    @holidaymaster.destroy

    respond_to do |format|
      format.html { redirect_to(holidaymasters_url) }
      format.xml  { head :ok }
    end
  end
 end