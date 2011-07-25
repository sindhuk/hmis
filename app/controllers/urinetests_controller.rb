class UrinetestsController < ApplicationController
  # GET /urinetests
  # GET /urinetests.xml
  def index
    @urinetests = Urinetest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @urinetests }
    end
  end

  # GET /urinetests/1
  # GET /urinetests/1.xml
  def show
    @urinetest = Urinetest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @urinetest }
    end
  end

  # GET /urinetests/new
  # GET /urinetests/new.xml
  def new
    @urinetest = Urinetest.new
	reg=params[:reg]
	if(reg)
		@urinetest.registration_no=reg
		@urinetest.mrno,@urinetest.billno,@urinetest.patientname=@urinetest.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @urinetest }
    end
  end

  # GET /urinetests/1/edit
  def edit
    @urinetest = Urinetest.find(params[:id])
  end

  # POST /urinetests
  # POST /urinetests.xml
  def create
    @urinetest = Urinetest.new(params[:urinetest])

    respond_to do |format|
      if @urinetest.save
        format.html { redirect_to(@urinetest, :notice => 'Urinetest was successfully created.') }
        format.xml  { render :xml => @urinetest, :status => :created, :location => @urinetest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @urinetest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /urinetests/1
  # PUT /urinetests/1.xml
  def update
    @urinetest = Urinetest.find(params[:id])

    respond_to do |format|
      if @urinetest.update_attributes(params[:urinetest])
        format.html { redirect_to(@urinetest, :notice => 'Urinetest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @urinetest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /urinetests/1
  # DELETE /urinetests/1.xml
  def destroy
    @urinetest = Urinetest.find(params[:id])
    @urinetest.destroy

    respond_to do |format|
      format.html { redirect_to(urinetests_url) }
      format.xml  { head :ok }
    end
  end
end
