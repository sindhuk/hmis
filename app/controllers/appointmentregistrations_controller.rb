class AppointmentregistrationsController < ApplicationController
  # GET /appointmentregistrations
  # GET /appointmentregistrations.xml
  def index
    @appointmentregistrations = Appointmentregistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointmentregistrations }
    end
  end

  # GET /appointmentregistrations/1
  # GET /appointmentregistrations/1.xml
  def show
    @appointmentregistration = Appointmentregistration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointmentregistration }
    end
  end

  # GET /appointmentregistrations/new
  # GET /appointmentregistrations/new.xml
  def new
    @appointmentregistration = Appointmentregistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointmentregistration }
    end
  end

  # GET /appointmentregistrations/1/edit
  def edit
    @appointmentregistration = Appointmentregistration.find(params[:id])
  end

  # POST /appointmentregistrations
  # POST /appointmentregistrations.xml
  def create
    @appointmentregistration = Appointmentregistration.new(params[:appointmentregistration])

    respond_to do |format|
      if @appointmentregistration.save
        format.html { redirect_to(@appointmentregistration, :notice => 'Appointmentregistration was successfully created.') }
        format.xml  { render :xml => @appointmentregistration, :status => :created, :location => @appointmentregistration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appointmentregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appointmentregistrations/1
  # PUT /appointmentregistrations/1.xml
  def update
    @appointmentregistration = Appointmentregistration.find(params[:id])

    respond_to do |format|
      if @appointmentregistration.update_attributes(params[:appointmentregistration])
        format.html { redirect_to(@appointmentregistration, :notice => 'Appointmentregistration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointmentregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointmentregistrations/1
  # DELETE /appointmentregistrations/1.xml
  def destroy
    @appointmentregistration = Appointmentregistration.find(params[:id])
    @appointmentregistration.destroy

    respond_to do |format|
      format.html { redirect_to(appointmentregistrations_url) }
      format.xml  { head :ok }
    end
  end
end
