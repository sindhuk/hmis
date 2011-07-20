class XraysController < ApplicationController
  # GET /xrays
  # GET /xrays.xml
  def index
    @xrays = Xray.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @xrays }
    end
  end

  # GET /xrays/1
  # GET /xrays/1.xml
  def show
    @xray = Xray.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @xray }
    end
  end

  # GET /xrays/new
  # GET /xrays/new.xml
  def new
    @xray = Xray.new
	reg=params[:reg]
	if(reg)
		@xray.registration_id=reg
		@xray.mrno,@xray.billno,@xray.patientname=@xray.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @xray }
    end
  end

  # GET /xrays/1/edit
  def edit
    @xray = Xray.find(params[:id])
  end

  # POST /xrays
  # POST /xrays.xml
  def create
    @xray = Xray.new(params[:xray])

    respond_to do |format|
      if @xray.save
        format.html { redirect_to(@xray, :notice => 'Xray was successfully created.') }
        format.xml  { render :xml => @xray, :status => :created, :location => @xray }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @xray.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /xrays/1
  # PUT /xrays/1.xml
  def update
    @xray = Xray.find(params[:id])

    respond_to do |format|
      if @xray.update_attributes(params[:xray])
        format.html { redirect_to(@xray, :notice => 'Xray was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @xray.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /xrays/1
  # DELETE /xrays/1.xml
  def destroy
    @xray = Xray.find(params[:id])
    @xray.destroy

    respond_to do |format|
      format.html { redirect_to(xrays_url) }
      format.xml  { head :ok }
    end
  end
end
