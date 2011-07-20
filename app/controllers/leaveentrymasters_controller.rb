class LeaveentrymastersController < ApplicationController
  # GET /leaveentrymasters
  # GET /leaveentrymasters.xml
  def index
    @leaveentrymasters = Leaveentrymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leaveentrymasters }
    end
  end

  # GET /leaveentrymasters/1
  # GET /leaveentrymasters/1.xml
  def show
    @leaveentrymaster = Leaveentrymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leaveentrymaster }
    end
  end

  # GET /leaveentrymasters/new
  # GET /leaveentrymasters/new.xml
  def new
    @leaveentrymaster = Leaveentrymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leaveentrymaster }
    end
  end

  # GET /leaveentrymasters/1/edit
  def edit
    @leaveentrymaster = Leaveentrymaster.find(params[:id])
  end

  # POST /leaveentrymasters
  # POST /leaveentrymasters.xml
  def create
    @leaveentrymaster = Leaveentrymaster.new(params[:leaveentrymaster])

    respond_to do |format|
      if @leaveentrymaster.save
        format.html { redirect_to(@leaveentrymaster, :notice => 'Leaveentrymaster was successfully created.') }
        format.xml  { render :xml => @leaveentrymaster, :status => :created, :location => @leaveentrymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leaveentrymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leaveentrymasters/1
  # PUT /leaveentrymasters/1.xml
  def update
    @leaveentrymaster = Leaveentrymaster.find(params[:id])

    respond_to do |format|
      if @leaveentrymaster.update_attributes(params[:leaveentrymaster])
        format.html { redirect_to(@leaveentrymaster, :notice => 'Leaveentrymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @leaveentrymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leaveentrymasters/1
  # DELETE /leaveentrymasters/1.xml
  def destroy
    @leaveentrymaster = Leaveentrymaster.find(params[:id])
    @leaveentrymaster.destroy

    respond_to do |format|
      format.html { redirect_to(leaveentrymasters_url) }
      format.xml  { head :ok }
    end
  end
end
