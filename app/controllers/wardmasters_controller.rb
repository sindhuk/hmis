class WardmastersController < ApplicationController
  # GET /wardmasters
  # GET /wardmasters.xml
  def index
    @wardmasters = Wardmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wardmasters }
    end
  end

  # GET /wardmasters/1
  # GET /wardmasters/1.xml
  def show
    @wardmaster = Wardmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wardmaster }
    end
  end

  # GET /wardmasters/new
  # GET /wardmasters/new.xml
  def new
    @wardmaster = Wardmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wardmaster }
    end
  end

  # GET /wardmasters/1/edit
  def edit
    @wardmaster = Wardmaster.find(params[:id])
  end

  # POST /wardmasters
  # POST /wardmasters.xml
  def create
    @wardmaster = Wardmaster.new(params[:wardmaster])

    respond_to do |format|
      if @wardmaster.save
        format.html { redirect_to(@wardmaster, :notice => 'Wardmaster was successfully created.') }
        format.xml  { render :xml => @wardmaster, :status => :created, :location => @wardmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wardmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wardmasters/1
  # PUT /wardmasters/1.xml
  def update
    @wardmaster = Wardmaster.find(params[:id])

    respond_to do |format|
      if @wardmaster.update_attributes(params[:wardmaster])
        format.html { redirect_to(@wardmaster, :notice => 'Wardmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wardmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wardmasters/1
  # DELETE /wardmasters/1.xml
  def destroy
    @wardmaster = Wardmaster.find(params[:id])
    @wardmaster.destroy

    respond_to do |format|
      format.html { redirect_to(wardmasters_url) }
      format.xml  { head :ok }
    end
  end
   
end
