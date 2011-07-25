class GastroscopytestsController < ApplicationController
  # GET /gastroscopytests
  # GET /gastroscopytests.xml
  def index
    @gastroscopytests = Gastroscopytest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gastroscopytests }
    end
  end

  # GET /gastroscopytests/1
  # GET /gastroscopytests/1.xml
  def show
    @gastroscopytest = Gastroscopytest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gastroscopytest }
    end
  end

  # GET /gastroscopytests/new
  # GET /gastroscopytests/new.xml
  def new
    @gastroscopytest = Gastroscopytest.new
	reg=params[:reg]
	if(reg)
		@gastroscopytest.registration_no=reg
		@gastroscopytest.mrno,@gastroscopytest.billno,@gastroscopytest.patientname=@gastroscopytest.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gastroscopytest }
    end
  end

  # GET /gastroscopytests/1/edit
  def edit
    @gastroscopytest = Gastroscopytest.find(params[:id])
  end

  # POST /gastroscopytests
  # POST /gastroscopytests.xml
  def create
    @gastroscopytest = Gastroscopytest.new(params[:gastroscopytest])

    respond_to do |format|
      if @gastroscopytest.save
        format.html { redirect_to(@gastroscopytest, :notice => 'Gastroscopytest was successfully created.') }
        format.xml  { render :xml => @gastroscopytest, :status => :created, :location => @gastroscopytest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gastroscopytest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gastroscopytests/1
  # PUT /gastroscopytests/1.xml
  def update
    @gastroscopytest = Gastroscopytest.find(params[:id])

    respond_to do |format|
      if @gastroscopytest.update_attributes(params[:gastroscopytest])
        format.html { redirect_to(@gastroscopytest, :notice => 'Gastroscopytest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gastroscopytest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gastroscopytests/1
  # DELETE /gastroscopytests/1.xml
  def destroy
    @gastroscopytest = Gastroscopytest.find(params[:id])
    @gastroscopytest.destroy

    respond_to do |format|
      format.html { redirect_to(gastroscopytests_url) }
      format.xml  { head :ok }
    end
  end
end
