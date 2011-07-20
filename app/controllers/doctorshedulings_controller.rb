class DoctorshedulingsController < ApplicationController
  # GET /doctorshedulings
  # GET /doctorshedulings.xml
  def index
    @doctorshedulings = Doctorsheduling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctorshedulings }
    end
  end

  # GET /doctorshedulings/1
  # GET /doctorshedulings/1.xml
  def show
    @doctorsheduling = Doctorsheduling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctorsheduling }
    end
  end

  # GET /doctorshedulings/new
  # GET /doctorshedulings/new.xml
  def new
    @doctorsheduling = Doctorsheduling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctorsheduling }
    end
  end

  # GET /doctorshedulings/1/edit
  def edit
    @doctorsheduling = Doctorsheduling.find(params[:id])
  end

  # POST /doctorshedulings
  # POST /doctorshedulings.xml
  def create
    @doctorsheduling = Doctorsheduling.new(params[:doctorsheduling])

    respond_to do |format|
      if @doctorsheduling.save
        format.html { redirect_to(@doctorsheduling, :notice => 'Doctorsheduling was successfully created.') }
        format.xml  { render :xml => @doctorsheduling, :status => :created, :location => @doctorsheduling }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctorsheduling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctorshedulings/1
  # PUT /doctorshedulings/1.xml
  def update
    @doctorsheduling = Doctorsheduling.find(params[:id])

    respond_to do |format|
      if @doctorsheduling.update_attributes(params[:doctorsheduling])
        format.html { redirect_to(@doctorsheduling, :notice => 'Doctorsheduling was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctorsheduling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctorshedulings/1
  # DELETE /doctorshedulings/1.xml
  def destroy
    @doctorsheduling = Doctorsheduling.find(params[:id])
    @doctorsheduling.destroy

    respond_to do |format|
      format.html { redirect_to(doctorshedulings_url) }
      format.xml  { head :ok }
    end
  end
end
