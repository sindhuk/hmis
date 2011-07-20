class PatientappointmentinfosController < ApplicationController
  # GET /patientappointmentinfos
  # GET /patientappointmentinfos.xml
  def index
    @patientappointmentinfos = Patientappointmentinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patientappointmentinfos }
    end
  end

  # GET /patientappointmentinfos/1
  # GET /patientappointmentinfos/1.xml
  def show
    @patientappointmentinfo = Patientappointmentinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patientappointmentinfo }
    end
  end

  # GET /patientappointmentinfos/new
  # GET /patientappointmentinfos/new.xml
  def new
    @patientappointmentinfo = Patientappointmentinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patientappointmentinfo }
    end
  end

  # GET /patientappointmentinfos/1/edit
  def edit
    @patientappointmentinfo = Patientappointmentinfo.find(params[:id])
  end

  # POST /patientappointmentinfos
  # POST /patientappointmentinfos.xml
  def create
    @patientappointmentinfo = Patientappointmentinfo.new(params[:patientappointmentinfo])

    respond_to do |format|
      if @patientappointmentinfo.save
        format.html { redirect_to(@patientappointmentinfo, :notice => 'Patientappointmentinfo was successfully created.') }
        format.xml  { render :xml => @patientappointmentinfo, :status => :created, :location => @patientappointmentinfo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patientappointmentinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patientappointmentinfos/1
  # PUT /patientappointmentinfos/1.xml
  def update
    @patientappointmentinfo = Patientappointmentinfo.find(params[:id])

    respond_to do |format|
      if @patientappointmentinfo.update_attributes(params[:patientappointmentinfo])
        format.html { redirect_to(@patientappointmentinfo, :notice => 'Patientappointmentinfo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patientappointmentinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patientappointmentinfos/1
  # DELETE /patientappointmentinfos/1.xml
  def destroy
    @patientappointmentinfo = Patientappointmentinfo.find(params[:id])
    @patientappointmentinfo.destroy

    respond_to do |format|
      format.html { redirect_to(patientappointmentinfos_url) }
      format.xml  { head :ok }
    end
  end
end
