class PatientinformationsController < ApplicationController
  # GET /patientinformations
  # GET /patientinformations.xml
  def index
    @patientinformations = Patientinformation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patientinformations }
    end
  end

  # GET /patientinformations/1
  # GET /patientinformations/1.xml
  def show
    @patientinformation = Patientinformation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patientinformation }
    end
  end

  # GET /patientinformations/new
  # GET /patientinformations/new.xml
  def new
    @patientinformation = Patientinformation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patientinformation }
    end
  end

  # GET /patientinformations/1/edit
  def edit
    @patientinformation = Patientinformation.find(params[:id])
  end

  # POST /patientinformations
  # POST /patientinformations.xml
  def create
    @patientinformation = Patientinformation.new(params[:patientinformation])

    respond_to do |format|
      if @patientinformation.save
        format.html { redirect_to(@patientinformation, :notice => 'Patientinformation was successfully created.') }
        format.xml  { render :xml => @patientinformation, :status => :created, :location => @patientinformation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patientinformation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patientinformations/1
  # PUT /patientinformations/1.xml
  def update
    @patientinformation = Patientinformation.find(params[:id])

    respond_to do |format|
      if @patientinformation.update_attributes(params[:patientinformation])
        format.html { redirect_to(@patientinformation, :notice => 'Patientinformation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patientinformation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patientinformations/1
  # DELETE /patientinformations/1.xml
  def destroy
    @patientinformation = Patientinformation.find(params[:id])
    @patientinformation.destroy

    respond_to do |format|
      format.html { redirect_to(patientinformations_url) }
      format.xml  { head :ok }
    end
  end
end
