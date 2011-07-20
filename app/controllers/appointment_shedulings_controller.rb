class AppointmentShedulingsController < ApplicationController
  # GET /appointment_shedulings
  # GET /appointment_shedulings.xml
  def index
    @appointment_shedulings = AppointmentSheduling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointment_shedulings }
    end
  end

  # GET /appointment_shedulings/1
  # GET /appointment_shedulings/1.xml
  def show
    @appointment_sheduling = AppointmentSheduling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment_sheduling }
    end
  end

  # GET /appointment_shedulings/new
  # GET /appointment_shedulings/new.xml
  def new
    @appointment_sheduling = AppointmentSheduling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment_sheduling }
    end
  end

  # GET /appointment_shedulings/1/edit
  def edit
    @appointment_sheduling = AppointmentSheduling.find(params[:id])
  end

  # POST /appointment_shedulings
  # POST /appointment_shedulings.xml
  def create
    @appointment_sheduling = AppointmentSheduling.new(params[:appointment_sheduling])

    respond_to do |format|
      if @appointment_sheduling.save
        format.html { redirect_to(@appointment_sheduling, :notice => 'AppointmentSheduling was successfully created.') }
        format.xml  { render :xml => @appointment_sheduling, :status => :created, :location => @appointment_sheduling }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appointment_sheduling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appointment_shedulings/1
  # PUT /appointment_shedulings/1.xml
  def update
    @appointment_sheduling = AppointmentSheduling.find(params[:id])

    respond_to do |format|
      if @appointment_sheduling.update_attributes(params[:appointment_sheduling])
        format.html { redirect_to(@appointment_sheduling, :notice => 'AppointmentSheduling was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointment_sheduling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_shedulings/1
  # DELETE /appointment_shedulings/1.xml
  def destroy
    @appointment_sheduling = AppointmentSheduling.find(params[:id])
    @appointment_sheduling.destroy

    respond_to do |format|
      format.html { redirect_to(appointment_shedulings_url) }
      format.xml  { head :ok }
    end
  end
end
