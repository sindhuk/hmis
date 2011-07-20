class DesignationmastersController < ApplicationController
  # GET /designationmasters
  # GET /designationmasters.xml
  def index
    @designationmasters = Designationmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @designationmasters }
    end
  end

  # GET /designationmasters/1
  # GET /designationmasters/1.xml
  def show
    @designationmaster = Designationmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @designationmaster }
    end
  end

  # GET /designationmasters/new
  # GET /designationmasters/new.xml
  def new
    @designationmaster = Designationmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @designationmaster }
    end
  end

  # GET /designationmasters/1/edit
  def edit
    @designationmaster = Designationmaster.find(params[:id])
  end

  # POST /designationmasters
  # POST /designationmasters.xml
  def create
    @designationmaster = Designationmaster.new(params[:designationmaster])

    respond_to do |format|
      if @designationmaster.save
        format.html { redirect_to(@designationmaster, :notice => 'Designationmaster was successfully created.') }
        format.xml  { render :xml => @designationmaster, :status => :created, :location => @designationmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @designationmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /designationmasters/1
  # PUT /designationmasters/1.xml
  def update
    @designationmaster = Designationmaster.find(params[:id])

    respond_to do |format|
      if @designationmaster.update_attributes(params[:designationmaster])
        format.html { redirect_to(@designationmaster, :notice => 'Designationmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @designationmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /designationmasters/1
  # DELETE /designationmasters/1.xml
  def destroy
    @designationmaster = Designationmaster.find(params[:id])
    @designationmaster.destroy

    respond_to do |format|
      format.html { redirect_to(designationmasters_url) }
      format.xml  { head :ok }
    end
  end
  
  def ajax_buildings
	name=params[:q]
	@departmentmaster = Departmentmaster.find_by_name(name)
	render :text =>	@departmentmaster.code
  end
end
