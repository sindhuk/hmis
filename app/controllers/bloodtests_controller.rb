class BloodtestsController < ApplicationController
  # GET /bloodtests
  # GET /bloodtests.xml
  def index
    @bloodtests = Bloodtest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bloodtests }
    end
  end

  # GET /bloodtests/1
  # GET /bloodtests/1.xml
  def show
    @bloodtest = Bloodtest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bloodtest }
    end
  end

  # GET /bloodtests/new
  # GET /bloodtests/new.xml
  def new
	@bloodtest = Bloodtest.new
	reg=params[:reg]
	if(reg)
		@bloodtest.registration_no=reg
		@bloodtest.mrno,@bloodtest.billno,@bloodtest.patientname=@bloodtest.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bloodtest }
    end
  end

  # GET /bloodtests/1/edit
  def edit
    @bloodtest = Bloodtest.find(params[:id])
  end

  # POST /bloodtests
  # POST /bloodtests.xml
  def create
    @bloodtest = Bloodtest.new(params[:bloodtest])

    respond_to do |format|
      if @bloodtest.save
        format.html { redirect_to(@bloodtest, :notice => 'Bloodtest was successfully created.') }
        format.xml  { render :xml => @bloodtest, :status => :created, :location => @bloodtest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bloodtest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bloodtests/1
  # PUT /bloodtests/1.xml
  def update
    @bloodtest = Bloodtest.find(params[:id])

    respond_to do |format|
      if @bloodtest.update_attributes(params[:bloodtest])
        format.html { redirect_to(@bloodtest, :notice => 'Bloodtest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bloodtest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bloodtests/1
  # DELETE /bloodtests/1.xml
  def destroy
    @bloodtest = Bloodtest.find(params[:id])
    @bloodtest.destroy

    respond_to do |format|
      format.html { redirect_to(bloodtests_url) }
      format.xml  { head :ok }
    end
  end
end
