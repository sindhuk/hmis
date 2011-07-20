class OccupationmastersController < ApplicationController
  # GET /occupationmasters
  # GET /occupationmasters.xml
  def index
    @occupationmasters = Occupationmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occupationmasters }
    end
  end

  # GET /occupationmasters/1
  # GET /occupationmasters/1.xml
  def show
    @occupationmaster = Occupationmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @occupationmaster }
    end
  end

  # GET /occupationmasters/new
  # GET /occupationmasters/new.xml
  def new
    @occupationmaster = Occupationmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @occupationmaster }
    end
  end

  # GET /occupationmasters/1/edit
  def edit
    @occupationmaster = Occupationmaster.find(params[:id])
  end

  # POST /occupationmasters
  # POST /occupationmasters.xml
  def create
    @occupationmaster = Occupationmaster.new(params[:occupationmaster])

    respond_to do |format|
      if @occupationmaster.save
        format.html { redirect_to(@occupationmaster, :notice => 'Occupationmaster was successfully created.') }
        format.xml  { render :xml => @occupationmaster, :status => :created, :location => @occupationmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @occupationmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /occupationmasters/1
  # PUT /occupationmasters/1.xml
  def update
    @occupationmaster = Occupationmaster.find(params[:id])

    respond_to do |format|
      if @occupationmaster.update_attributes(params[:occupationmaster])
        format.html { redirect_to(@occupationmaster, :notice => 'Occupationmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @occupationmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /occupationmasters/1
  # DELETE /occupationmasters/1.xml
  def destroy
    @occupationmaster = Occupationmaster.find(params[:id])
    @occupationmaster.destroy

    respond_to do |format|
      format.html { redirect_to(occupationmasters_url) }
      format.xml  { head :ok }
    end
  end
end
