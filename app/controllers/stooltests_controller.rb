class StooltestsController < ApplicationController
  # GET /stooltests
  # GET /stooltests.xml
  def index
    @stooltests = Stooltest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stooltests }
    end
  end

  # GET /stooltests/1
  # GET /stooltests/1.xml
  def show
    @stooltest = Stooltest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stooltest }
    end
  end

  # GET /stooltests/new
  # GET /stooltests/new.xml
  def new
    @stooltest = Stooltest.new
	reg=params[:reg]
	if(reg)
		@stooltest.registration_no=reg
		@stooltest.mrno,@stooltest.billno,@stooltest.patientname=@stooltest.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stooltest }
    end
  end

  # GET /stooltests/1/edit
  def edit
    @stooltest = Stooltest.find(params[:id])
  end

  # POST /stooltests
  # POST /stooltests.xml
  def create
    @stooltest = Stooltest.new(params[:stooltest])

    respond_to do |format|
      if @stooltest.save
        format.html { redirect_to(@stooltest, :notice => 'Stooltest was successfully created.') }
        format.xml  { render :xml => @stooltest, :status => :created, :location => @stooltest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stooltest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stooltests/1
  # PUT /stooltests/1.xml
  def update
    @stooltest = Stooltest.find(params[:id])

    respond_to do |format|
      if @stooltest.update_attributes(params[:stooltest])
        format.html { redirect_to(@stooltest, :notice => 'Stooltest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stooltest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stooltests/1
  # DELETE /stooltests/1.xml
  def destroy
    @stooltest = Stooltest.find(params[:id])
    @stooltest.destroy

    respond_to do |format|
      format.html { redirect_to(stooltests_url) }
      format.xml  { head :ok }
    end
  end
end
