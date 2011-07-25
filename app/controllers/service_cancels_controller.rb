class ServiceCancelsController < ApplicationController
  # GET /service_cancels
  # GET /service_cancels.xml
  def index
    @service_cancels = ServiceCancel.all
	@v= Verify.new
	@value=@v.retrive("Services Cancel")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_cancels }
    end
  end

  # GET /service_cancels/1
  # GET /service_cancels/1.xml
  def show
    @service_cancel = ServiceCancel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_cancel }
    end
  end

  # GET /service_cancels/new
  # GET /service_cancels/new.xml
  def new
    @service_cancel = ServiceCancel.new
    1.times{@service_cancel.service_cancel_service.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_cancel }
    end
  end

  # GET /service_cancels/1/edit
  def edit
    @service_cancel = ServiceCancel.find(params[:id])
  end

  # POST /service_cancels
  # POST /service_cancels.xml
  def create
    @service_cancel = ServiceCancel.new(params[:service_cancel])

    respond_to do |format|
      if @service_cancel.save
        format.html { redirect_to(@service_cancel, :notice => 'ServiceCancel was successfully created.') }
        format.xml  { render :xml => @service_cancel, :status => :created, :location => @service_cancel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_cancel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_cancels/1
  # PUT /service_cancels/1.xml
  def update
    @service_cancel = ServiceCancel.find(params[:id])

    respond_to do |format|
      if @service_cancel.update_attributes(params[:service_cancel])
        format.html { redirect_to(@service_cancel, :notice => 'ServiceCancel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_cancel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_cancels/1
  # DELETE /service_cancels/1.xml
  def destroy
    @service_cancel = ServiceCancel.find(params[:id])
    @service_cancel.destroy

    respond_to do |format|
      format.html { redirect_to(service_cancels_url) }
      format.xml  { head :ok }
    end
  end
  
   def ajax_buildings
		mr=params[:q]
		@pa=PatientregistrationData.find_by_mr_no(mr)
		if(@pa)
		render :text => @pa.reg_no+","+@pa.first_name+","+@pa.father_name 
		 else
		render :text =>"Invalid MR_NUMBER"
		end
	end
     
    def ajax_buildings1
		mr=params[:q]
		@test = Testmaster.find_by_test_name(mr)
		render :text =>@test.test_code+","+@test.fee.to_s
		end	 
  
  
end
