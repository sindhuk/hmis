class UsermastersController < ApplicationController
  # GET /usermasters
  # GET /usermasters.xml
  def index
    @usermasters = Usermaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usermasters }
    end
  end

  # GET /usermasters/1
  # GET /usermasters/1.xml
  def show
    @usermaster = Usermaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usermaster }
    end
  end

  # GET /usermasters/new
  # GET /usermasters/new.xml
  def new
    @usermaster = Usermaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usermaster }
    end
  end

  # GET /usermasters/1/edit
  def edit
    @usermaster = Usermaster.find(params[:id])
  end

  # POST /usermasters
  # POST /usermasters.xml
  def create
    @usermaster = Usermaster.new(params[:usermaster])

    respond_to do |format|
      if @usermaster.save
        format.html { redirect_to(@usermaster, :notice => 'Usermaster was successfully created.') }
        format.xml  { render :xml => @usermaster, :status => :created, :location => @usermaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usermaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usermasters/1
  # PUT /usermasters/1.xml
  def update
    @usermaster = Usermaster.find(params[:id])

    respond_to do |format|
      if @usermaster.update_attributes(params[:usermaster])
        format.html { redirect_to(@usermaster, :notice => 'Usermaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usermaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usermasters/1
  # DELETE /usermasters/1.xml
  def destroy
    @usermaster = Usermaster.find(params[:id])
    @usermaster.destroy

    respond_to do |format|
      format.html { redirect_to(usermasters_url) }
      format.xml  { head :ok }
    end
  end
end
