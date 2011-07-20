class LeavemastersController < ApplicationController
  # GET /leavemasters
  # GET /leavemasters.xml
  def index
    @leavemasters = Leavemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leavemasters }
    end
  end

  # GET /leavemasters/1
  # GET /leavemasters/1.xml
  def show
    @leavemaster = Leavemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leavemaster }
    end
  end

  # GET /leavemasters/new
  # GET /leavemasters/new.xml
  def new
    @leavemaster = Leavemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leavemaster }
    end
  end

  # GET /leavemasters/1/edit
  def edit
    @leavemaster = Leavemaster.find(params[:id])
  end

  # POST /leavemasters
  # POST /leavemasters.xml
  def create
    @leavemaster = Leavemaster.new(params[:leavemaster])

    respond_to do |format|
      if @leavemaster.save
        format.html { redirect_to(@leavemaster, :notice => 'Leavemaster was successfully created.') }
        format.xml  { render :xml => @leavemaster, :status => :created, :location => @leavemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leavemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leavemasters/1
  # PUT /leavemasters/1.xml
  def update
    @leavemaster = Leavemaster.find(params[:id])

    respond_to do |format|
      if @leavemaster.update_attributes(params[:leavemaster])
        format.html { redirect_to(@leavemaster, :notice => 'Leavemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @leavemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leavemasters/1
  # DELETE /leavemasters/1.xml
  def destroy
    @leavemaster = Leavemaster.find(params[:id])
    @leavemaster.destroy

    respond_to do |format|
      format.html { redirect_to(leavemasters_url) }
      format.xml  { head :ok }
    end
  end
end
