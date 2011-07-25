class PatientappointmentregistrationsController < ApplicationController
  # GET /patientappointmentregistrations
  # GET /patientappointmentregistrations.xml
  def index
    @patientappointmentregistrations = Patientappointmentregistration.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patientappointmentregistrations }
    end
  end

  # GET /patientappointmentregistrations/1
  # GET /patientappointmentregistrations/1.xml
  def show
    @patientappointmentregistration = Patientappointmentregistration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patientappointmentregistration }
    end
  end

  # GET /patientappointmentregistrations/new
  # GET /patientappointmentregistrations/new.xml
  def new
    @patientappointmentregistration = Patientappointmentregistration.new
	@patient = Patientappointmentregistration.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patientappointmentregistration }
    end
  end

  # GET /patientappointmentregistrations/1/edit
  def edit
    @patientappointmentregistration = Patientappointmentregistration.find(params[:id])
  end

  # POST /patientappointmentregistrations
  # POST /patientappointmentregistrations.xml
  def create
    @patientappointmentregistration = Patientappointmentregistration.new(params[:patientappointmentregistration])

    respond_to do |format|
      if @patientappointmentregistration.save
        format.html { redirect_to(@patientappointmentregistration, :notice => 'Patientappointmentregistration was successfully created.') }
        format.xml  { render :xml => @patientappointmentregistration, :status => :created, :location => @patientappointmentregistration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patientappointmentregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patientappointmentregistrations/1
  # PUT /patientappointmentregistrations/1.xml
  def update
    @patientappointmentregistration = Patientappointmentregistration.find(params[:id])

    respond_to do |format|
      if @patientappointmentregistration.update_attributes(params[:patientappointmentregistration])
        format.html { redirect_to(@patientappointmentregistration, :notice => 'Patientappointmentregistration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patientappointmentregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patientappointmentregistrations/1
  # DELETE /patientappointmentregistrations/1.xml
  def destroy
    @patientappointmentregistration = Patientappointmentregistration.find(params[:id])
    @patientappointmentregistration.destroy

    respond_to do |format|
      format.html { redirect_to(patientappointmentregistrations_url) }
      format.xml  { head :ok }
    end
  end
end
