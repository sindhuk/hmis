class ChildmastersController < ApplicationController
  # GET /childmasters
  # GET /childmasters.xml
  def index
    @childmasters = Childmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @childmasters }
    end
  end

  # GET /childmasters/1
  # GET /childmasters/1.xml
  def show
    @childmaster = Childmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @childmaster }
    end
  end

  # GET /childmasters/new
  # GET /childmasters/new.xml
  def new
    @childmaster = Childmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @childmaster }
    end
  end

  # GET /childmasters/1/edit
  def edit
    @childmaster = Childmaster.find(params[:id])
  end

  # POST /childmasters
  # POST /childmasters.xml
  def create
    @childmaster = Childmaster.new(params[:childmaster])

    respond_to do |format|
      if @childmaster.save
        format.html { redirect_to(@childmaster, :notice => 'Childmaster was successfully created.') }
        format.xml  { render :xml => @childmaster, :status => :created, :location => @childmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @childmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /childmasters/1
  # PUT /childmasters/1.xml
  def update
    @childmaster = Childmaster.find(params[:id])

    respond_to do |format|
      if @childmaster.update_attributes(params[:childmaster])
        format.html { redirect_to(@childmaster, :notice => 'Childmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @childmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /childmasters/1
  # DELETE /childmasters/1.xml
  def destroy
    @childmaster = Childmaster.find(params[:id])
    @childmaster.destroy

    respond_to do |format|
      format.html { redirect_to(childmasters_url) }
      format.xml  { head :ok }
    end
  end
end
