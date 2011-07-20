class LoginmastersController < ApplicationController
  # GET /loginmasters
  # GET /loginmasters.xml
  def index
    @loginmasters = Loginmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loginmasters }
    end
  end

  # GET /loginmasters/1
  # GET /loginmasters/1.xml
  def show
    @loginmaster = Loginmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loginmaster }
    end
  end

  # GET /loginmasters/new
  # GET /loginmasters/new.xml
  def new
    @loginmaster = Loginmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loginmaster }
    end
  end

  # GET /loginmasters/1/edit
  def edit
    @loginmaster = Loginmaster.find(params[:id])
  end

  # POST /loginmasters
  # POST /loginmasters.xml
  def create
    @loginmaster = Loginmaster.new(params[:loginmaster])

    respond_to do |format|
      if @loginmaster.save
        format.html { redirect_to(@loginmaster, :notice => 'Loginmaster was successfully created.') }
        format.xml  { render :xml => @loginmaster, :status => :created, :location => @loginmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loginmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loginmasters/1
  # PUT /loginmasters/1.xml
  def update
    @loginmaster = Loginmaster.find(params[:id])

    respond_to do |format|
      if @loginmaster.update_attributes(params[:loginmaster])
        format.html { redirect_to(@loginmaster, :notice => 'Loginmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loginmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loginmasters/1
  # DELETE /loginmasters/1.xml
  def destroy
    @loginmaster = Loginmaster.find(params[:id])
    @loginmaster.destroy

    respond_to do |format|
      format.html { redirect_to(loginmasters_url) }
      format.xml  { head :ok }
    end
  end
end
