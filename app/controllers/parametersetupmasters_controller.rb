class ParametersetupmastersController < ApplicationController
  # GET /parametersetupmasters
  # GET /parametersetupmasters.xml
  def index
    @parametersetupmasters = Parametersetupmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parametersetupmasters }
    end
  end

  # GET /parametersetupmasters/1
  # GET /parametersetupmasters/1.xml
  def show
    @parametersetupmaster = Parametersetupmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parametersetupmaster }
    end
  end

  # GET /parametersetupmasters/new
  # GET /parametersetupmasters/new.xml
  def new
    @parametersetupmaster = Parametersetupmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parametersetupmaster }
    end
  end

  # GET /parametersetupmasters/1/edit
  def edit
    @parametersetupmaster = Parametersetupmaster.find(params[:id])
  end

  # POST /parametersetupmasters
  # POST /parametersetupmasters.xml
  def create
    @parametersetupmaster = Parametersetupmaster.new(params[:parametersetupmaster])

    respond_to do |format|
      if @parametersetupmaster.save
        format.html { redirect_to(@parametersetupmaster, :notice => 'Parametersetupmaster was successfully created.') }
        format.xml  { render :xml => @parametersetupmaster, :status => :created, :location => @parametersetupmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parametersetupmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parametersetupmasters/1
  # PUT /parametersetupmasters/1.xml
  def update
    @parametersetupmaster = Parametersetupmaster.find(params[:id])

    respond_to do |format|
      if @parametersetupmaster.update_attributes(params[:parametersetupmaster])
        format.html { redirect_to(@parametersetupmaster, :notice => 'Parametersetupmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parametersetupmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parametersetupmasters/1
  # DELETE /parametersetupmasters/1.xml
  def destroy
    @parametersetupmaster = Parametersetupmaster.find(params[:id])
    @parametersetupmaster.destroy

    respond_to do |format|
      format.html { redirect_to(parametersetupmasters_url) }
      format.xml  { head :ok }
    end
  end
end
