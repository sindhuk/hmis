class ProfilemastersController < ApplicationController
  # GET /profilemasters
  # GET /profilemasters.xml
  def index
    @profilemasters = Profilemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profilemasters }
    end
  end

  # GET /profilemasters/1
  # GET /profilemasters/1.xml
  def show
    @profilemaster = Profilemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profilemaster }
    end
  end

  # GET /profilemasters/new
  # GET /profilemasters/new.xml
  def new
    @profilemaster = Profilemaster.new
     @data = FormsList.all
    @i=0
    @data.length.times { 
      @na=@profilemaster.childmaster.build
      @na.forms = @data[@i].form_name
     @i+=1
    }
    @da=@data.length
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profilemaster }
    end
  end

  # GET /profilemasters/1/edit
  def edit
    @profilemaster = Profilemaster.find(params[:id])
	
  end

  # POST /profilemasters
  # POST /profilemasters.xml
  def create
    @profilemaster = Profilemaster.new(params[:profilemaster])

    respond_to do |format|
      if @profilemaster.save
        format.html { redirect_to(@profilemaster, :notice => 'Profilemaster was successfully created.') }
        format.xml  { render :xml => @profilemaster, :status => :created, :location => @profilemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profilemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profilemasters/1
  # PUT /profilemasters/1.xml
  def update
    @profilemaster = Profilemaster.find(params[:id])

    respond_to do |format|
      if @profilemaster.update_attributes(params[:profilemaster])
        format.html { redirect_to(@profilemaster, :notice => 'Profilemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profilemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profilemasters/1
  # DELETE /profilemasters/1.xml
  def destroy
    @profilemaster = Profilemaster.find(params[:id])
    @profilemaster.destroy

    respond_to do |format|
      format.html { redirect_to(profilemasters_url) }
      format.xml  { head :ok }
    end
  end
end
