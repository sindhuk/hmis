class SonographytestsController < ApplicationController
  # GET /sonographytests
  # GET /sonographytests.xml
  def index
    @sonographytests = Sonographytest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sonographytests }
    end
  end

  # GET /sonographytests/1
  # GET /sonographytests/1.xml
  def show
    @sonographytest = Sonographytest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sonographytest }
    end
  end

  # GET /sonographytests/new
  # GET /sonographytests/new.xml
  def new
    @sonographytest = Sonographytest.new
	reg=params[:reg]
	if(reg)
		@sonographytest.registration_no=reg
		@sonographytest.mrno,@sonographytest.billno,@sonographytest.patientname=@sonographytest.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sonographytest }
    end
  end

  # GET /sonographytests/1/edit
  def edit
    @sonographytest = Sonographytest.find(params[:id])
  end

  # POST /sonographytests
  # POST /sonographytests.xml
  def create
    @sonographytest = Sonographytest.new(params[:sonographytest])

    respond_to do |format|
      if @sonographytest.save
        format.html { redirect_to(@sonographytest, :notice => 'Sonographytest was successfully created.') }
        format.xml  { render :xml => @sonographytest, :status => :created, :location => @sonographytest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sonographytest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sonographytests/1
  # PUT /sonographytests/1.xml
  def update
    @sonographytest = Sonographytest.find(params[:id])

    respond_to do |format|
      if @sonographytest.update_attributes(params[:sonographytest])
        format.html { redirect_to(@sonographytest, :notice => 'Sonographytest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sonographytest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sonographytests/1
  # DELETE /sonographytests/1.xml
  def destroy
    @sonographytest = Sonographytest.find(params[:id])
    @sonographytest.destroy

    respond_to do |format|
      format.html { redirect_to(sonographytests_url) }
      format.xml  { head :ok }
    end
  end
end
