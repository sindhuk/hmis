class PatientFeesController < ApplicationController
  # GET /patient_fees
  # GET /patient_fees.xml
  def index
    @patient_fees = PatientFee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_fees }
    end
  end

  # GET /patient_fees/1
  # GET /patient_fees/1.xml
  def show
    @patient_fee = PatientFee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_fee }
    end
  end

  # GET /patient_fees/new
  # GET /patient_fees/new.xml
  def new
    @patient_fee = PatientFee.new
	reg=params[:reg]
	if(reg)
		@patient_fee.registration_id=reg
		@patient_fee.mrno,@patient_fee.billno,@patient_fee.patientname=@patient_fee.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_fee }
    end
  end

  # GET /patient_fees/1/edit
  def edit
    @patient_fee = PatientFee.find(params[:id])
  end

  # POST /patient_fees
  # POST /patient_fees.xml
  def create
    @patient_fee = PatientFee.new(params[:patient_fee])

    respond_to do |format|
      if @patient_fee.save
        format.html { redirect_to(@patient_fee, :notice => 'PatientFee was successfully created.') }
        format.xml  { render :xml => @patient_fee, :status => :created, :location => @patient_fee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_fee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_fees/1
  # PUT /patient_fees/1.xml
  def update
    @patient_fee = PatientFee.find(params[:id])

    respond_to do |format|
      if @patient_fee.update_attributes(params[:patient_fee])
        format.html { redirect_to(@patient_fee, :notice => 'PatientFee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_fee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_fees/1
  # DELETE /patient_fees/1.xml
  def destroy
    @patient_fee = PatientFee.find(params[:id])
    @patient_fee.destroy

    respond_to do |format|
      format.html { redirect_to(patient_fees_url) }
      format.xml  { head :ok }
    end
  end
end
