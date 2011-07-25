class DepartmentmastersController < ApplicationController
  # GET /departmentmasters
  # GET /departmentmasters.xml
  def index
    @departmentmasters = Departmentmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departmentmasters }
    end
  end

  # GET /departmentmasters/1
  # GET /departmentmasters/1.xml
  def show
    @departmentmaster = Departmentmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @departmentmaster }
    end
  end

  # GET /departmentmasters/new
  # GET /departmentmasters/new.xml
  def new
    @departmentmaster = Departmentmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @departmentmaster }
    end
  end

  # GET /departmentmasters/1/edit
  def edit
    @departmentmaster = Departmentmaster.find(params[:id])
  end

  # POST /departmentmasters
  # POST /departmentmasters.xml
  def create
    @departmentmaster = Departmentmaster.new(params[:departmentmaster])

    respond_to do |format|
      if @departmentmaster.save
        format.html { redirect_to(@departmentmaster, :notice => 'Departmentmaster was successfully created.') }
        format.xml  { render :xml => @departmentmaster, :status => :created, :location => @departmentmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @departmentmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departmentmasters/1
  # PUT /departmentmasters/1.xml
  def update
    @departmentmaster = Departmentmaster.find(params[:id])

    respond_to do |format|
      if @departmentmaster.update_attributes(params[:departmentmaster])
        format.html { redirect_to(@departmentmaster, :notice => 'Departmentmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @departmentmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departmentmasters/1
  # DELETE /departmentmasters/1.xml
  def destroy
    @departmentmaster = Departmentmaster.find(params[:id])
    @departmentmaster.destroy

    respond_to do |format|
      format.html { redirect_to(departmentmasters_url) }
      format.xml  { head :ok }
    end
  end
end
