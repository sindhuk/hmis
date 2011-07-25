class DoctorsschedulingsController < ApplicationController
  # GET /doctorsschedulings
  # GET /doctorsschedulings.xml
  def index
    @doctorsschedulings = Doctorsscheduling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctorsschedulings }
    end
  end

  # GET /doctorsschedulings/1
  # GET /doctorsschedulings/1.xml
  def show
    @doctorsscheduling = Doctorsscheduling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctorsscheduling }
    end
  end

  # GET /doctorsschedulings/new
  # GET /doctorsschedulings/new.xml
  def new
    @doctorsscheduling = Doctorsscheduling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctorsscheduling }
    end
  end

  # GET /doctorsschedulings/1/edit
  def edit
    @doctorsscheduling = Doctorsscheduling.find(params[:id])
  end

  # POST /doctorsschedulings
  # POST /doctorsschedulings.xml
  def create
    @doctorsscheduling = Doctorsscheduling.new(params[:doctorsscheduling])

    respond_to do |format|
      if @doctorsscheduling.save
        format.html { redirect_to(@doctorsscheduling, :notice => 'Doctorsscheduling was successfully created.') }
        format.xml  { render :xml => @doctorsscheduling, :status => :created, :location => @doctorsscheduling }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctorsscheduling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctorsschedulings/1
  # PUT /doctorsschedulings/1.xml
  def update
    @doctorsscheduling = Doctorsscheduling.find(params[:id])

    respond_to do |format|
      if @doctorsscheduling.update_attributes(params[:doctorsscheduling])
        format.html { redirect_to(@doctorsscheduling, :notice => 'Doctorsscheduling was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctorsscheduling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctorsschedulings/1
  # DELETE /doctorsschedulings/1.xml
  def destroy
    @doctorsscheduling = Doctorsscheduling.find(params[:id])
    @doctorsscheduling.destroy

    respond_to do |format|
      format.html { redirect_to(doctorsschedulings_url) }
      format.xml  { head :ok }
    end
  end
end
