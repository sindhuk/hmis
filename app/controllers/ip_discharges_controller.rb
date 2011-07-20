class IpDischargesController < ApplicationController
  # GET /ip_discharges
  # GET /ip_discharges.xml
  def index
    @ip_discharges = IpDischarge.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ip_discharges }
    end
  end

  # GET /ip_discharges/1
  # GET /ip_discharges/1.xml
  def show
    @ip_discharge = IpDischarge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ip_discharge }
    end
  end

  # GET /ip_discharges/new
  # GET /ip_discharges/new.xml
  def new
    @ip_discharge = IpDischarge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ip_discharge }
    end
  end

  # GET /ip_discharges/1/edit
  def edit
    @ip_discharge = IpDischarge.find(params[:id])
  end

  # POST /ip_discharges
  # POST /ip_discharges.xml
  def create
    @ip_discharge = IpDischarge.new(params[:ip_discharge])

    respond_to do |format|
      if @ip_discharge.save
        format.html { redirect_to(@ip_discharge, :notice => 'IpDischarge was successfully created.') }
        format.xml  { render :xml => @ip_discharge, :status => :created, :location => @ip_discharge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ip_discharge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ip_discharges/1
  # PUT /ip_discharges/1.xml
  def update
    @ip_discharge = IpDischarge.find(params[:id])

    respond_to do |format|
      if @ip_discharge.update_attributes(params[:ip_discharge])
        format.html { redirect_to(@ip_discharge, :notice => 'IpDischarge was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ip_discharge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_discharges/1
  # DELETE /ip_discharges/1.xml
  def destroy
    @ip_discharge = IpDischarge.find(params[:id])
    @ip_discharge.destroy

    respond_to do |format|
      format.html { redirect_to(ip_discharges_url) }
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
end
