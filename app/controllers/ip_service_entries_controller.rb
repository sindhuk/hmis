class IpServiceEntriesController < ApplicationController
  # GET /ip_service_entries
  # GET /ip_service_entries.xml
  def index
    @ip_service_entries = IpServiceEntry.all
	@v= Verify.new
	@value=@v.retrive("Services Entry")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ip_service_entries }
    end
  end

  # GET /ip_service_entries/1
  # GET /ip_service_entries/1.xml
  def show
    @ip_service_entry = IpServiceEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ip_service_entry }
    end
  end

  # GET /ip_service_entries/new
  # GET /ip_service_entries/new.xml
  def new
    @ip_service_entry = IpServiceEntry.new
    1.times{@ip_service_entry.ip_service.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ip_service_entry }
    end
  end

  # GET /ip_service_entries/1/edit
  def edit
    @ip_service_entry = IpServiceEntry.find(params[:id])
  end

  # POST /ip_service_entries
  # POST /ip_service_entries.xml
  def create
    @ip_service_entry = IpServiceEntry.new(params[:ip_service_entry])

    respond_to do |format|
      if @ip_service_entry.save
        format.html { redirect_to(@ip_service_entry, :notice => 'IpServiceEntry was successfully created.') }
        format.xml  { render :xml => @ip_service_entry, :status => :created, :location => @ip_service_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ip_service_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ip_service_entries/1
  # PUT /ip_service_entries/1.xml
  def update
    @ip_service_entry = IpServiceEntry.find(params[:id])

    respond_to do |format|
      if @ip_service_entry.update_attributes(params[:ip_service_entry])
        format.html { redirect_to(@ip_service_entry, :notice => 'IpServiceEntry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ip_service_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_service_entries/1
  # DELETE /ip_service_entries/1.xml
  def destroy
    @ip_service_entry = IpServiceEntry.find(params[:id])
    @ip_service_entry.destroy

    respond_to do |format|
      format.html { redirect_to(ip_service_entries_url) }
      format.xml  { head :ok }
    end
  end
  def ajax_buildings
		mr=params[:q]
		type=params[:type]
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
