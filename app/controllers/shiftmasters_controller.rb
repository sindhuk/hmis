class ShiftmastersController < ApplicationController
  # GET /shiftmasters
  # GET /shiftmasters.xml
  def index
    @shiftmasters = Shiftmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shiftmasters }
    end
  end

  # GET /shiftmasters/1
  # GET /shiftmasters/1.xml
  def show
    @shiftmaster = Shiftmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shiftmaster }
    end
  end

  # GET /shiftmasters/new
  # GET /shiftmasters/new.xml
  def new
    @shiftmaster = Shiftmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shiftmaster }
    end
  end

  # GET /shiftmasters/1/edit
  def edit
    @shiftmaster = Shiftmaster.find(params[:id])
  end

  # POST /shiftmasters
  # POST /shiftmasters.xml
  def create
    @shiftmaster = Shiftmaster.new(params[:shiftmaster])

    respond_to do |format|
      if @shiftmaster.save
        format.html { redirect_to(@shiftmaster, :notice => 'Shiftmaster was successfully created.') }
        format.xml  { render :xml => @shiftmaster, :status => :created, :location => @shiftmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shiftmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shiftmasters/1
  # PUT /shiftmasters/1.xml
  def update
    @shiftmaster = Shiftmaster.find(params[:id])

    respond_to do |format|
      if @shiftmaster.update_attributes(params[:shiftmaster])
        format.html { redirect_to(@shiftmaster, :notice => 'Shiftmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shiftmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shiftmasters/1
  # DELETE /shiftmasters/1.xml
  def destroy
    @shiftmaster = Shiftmaster.find(params[:id])
    @shiftmaster.destroy

    respond_to do |format|
      format.html { redirect_to(shiftmasters_url) }
      format.xml  { head :ok }
    end
  end
end
