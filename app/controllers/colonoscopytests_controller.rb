class ColonoscopytestsController < ApplicationController
  # GET /colonoscopytests
  # GET /colonoscopytests.xml
  def index
    @colonoscopytests = Colonoscopytest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @colonoscopytests }
    end
  end

  # GET /colonoscopytests/1
  # GET /colonoscopytests/1.xml
  def show
    @colonoscopytest = Colonoscopytest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @colonoscopytest }
    end
  end

  # GET /colonoscopytests/new
  # GET /colonoscopytests/new.xml
  def new
    @colonoscopytest = Colonoscopytest.new
	reg=params[:reg]
	if(reg)
		@colonoscopytest.registration_no=reg
		@colonoscopytest.mrno,@colonoscopytest.billno,@colonoscopytest.patientname=@colonoscopytest.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @colonoscopytest }
    end
  end

  # GET /colonoscopytests/1/edit
  def edit
    @colonoscopytest = Colonoscopytest.find(params[:id])
  end

  # POST /colonoscopytests
  # POST /colonoscopytests.xml
  def create
    @colonoscopytest = Colonoscopytest.new(params[:colonoscopytest])

    respond_to do |format|
      if @colonoscopytest.save
        format.html { redirect_to(@colonoscopytest, :notice => 'Colonoscopytest was successfully created.') }
        format.xml  { render :xml => @colonoscopytest, :status => :created, :location => @colonoscopytest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @colonoscopytest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /colonoscopytests/1
  # PUT /colonoscopytests/1.xml
  def update
    @colonoscopytest = Colonoscopytest.find(params[:id])

    respond_to do |format|
      if @colonoscopytest.update_attributes(params[:colonoscopytest])
        format.html { redirect_to(@colonoscopytest, :notice => 'Colonoscopytest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @colonoscopytest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /colonoscopytests/1
  # DELETE /colonoscopytests/1.xml
  def destroy
    @colonoscopytest = Colonoscopytest.find(params[:id])
    @colonoscopytest.destroy

    respond_to do |format|
      format.html { redirect_to(colonoscopytests_url) }
      format.xml  { head :ok }
    end
  end
end
