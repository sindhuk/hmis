class DoctorChargesController < ApplicationController
  # GET /doctor_charges
  # GET /doctor_charges.xml
  def index
    @doctor_charges = DoctorCharge.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctor_charges }
    end
  end

  # GET /doctor_charges/1
  # GET /doctor_charges/1.xml
  def show
    @doctor_charge = DoctorCharge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctor_charge }
    end
  end

  # GET /doctor_charges/new
  # GET /doctor_charges/new.xml
  def new
    @doctor_charge = DoctorCharge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctor_charge }
    end
  end

  # GET /doctor_charges/1/edit
  def edit
    @doctor_charge = DoctorCharge.find(params[:id])
  end

  # POST /doctor_charges
  # POST /doctor_charges.xml
  def create
    @doctor_charge = DoctorCharge.new(params[:doctor_charge])

    respond_to do |format|
      if @doctor_charge.save
        format.html { redirect_to(@doctor_charge, :notice => 'DoctorCharge was successfully created.') }
        format.xml  { render :xml => @doctor_charge, :status => :created, :location => @doctor_charge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor_charge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctor_charges/1
  # PUT /doctor_charges/1.xml
  def update
    @doctor_charge = DoctorCharge.find(params[:id])

    respond_to do |format|
      if @doctor_charge.update_attributes(params[:doctor_charge])
        format.html { redirect_to(@doctor_charge, :notice => 'DoctorCharge was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor_charge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_charges/1
  # DELETE /doctor_charges/1.xml
  def destroy
    @doctor_charge = DoctorCharge.find(params[:id])
    @doctor_charge.destroy

    respond_to do |format|
      format.html { redirect_to(doctor_charges_url) }
      format.xml  { head :ok }
    end
  end
  
   def ajax_buildings
		mr=params[:q]
		
		@pa=PatientregistrationData.find_by_mr_no(mr)
		if(@pa)
		render :text => @pa.Reg_No+","+@pa.first_name+","+@pa.father_name 
		 else
		render :text =>"Invalid MR_NUMBER"
		end
		end
end
