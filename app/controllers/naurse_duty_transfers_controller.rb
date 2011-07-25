class NaurseDutyTransfersController < ApplicationController
  # GET /naurse_duty_transfers
  # GET /naurse_duty_transfers.xml
  def index
    @naurse_duty_transfers = NaurseDutyTransfer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @naurse_duty_transfers }
    end
  end

  # GET /naurse_duty_transfers/1
  # GET /naurse_duty_transfers/1.xml
  def show
    @naurse_duty_transfer = NaurseDutyTransfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @naurse_duty_transfer }
    end
  end

  # GET /naurse_duty_transfers/new
  # GET /naurse_duty_transfers/new.xml
  def new
    @naurse_duty_transfer = NaurseDutyTransfer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @naurse_duty_transfer }
    end
  end

  # GET /naurse_duty_transfers/1/edit
  def edit
    @naurse_duty_transfer = NaurseDutyTransfer.find(params[:id])
  end

  # POST /naurse_duty_transfers
  # POST /naurse_duty_transfers.xml
  def create
    @naurse_duty_transfer = NaurseDutyTransfer.new(params[:naurse_duty_transfer])

    respond_to do |format|
      if @naurse_duty_transfer.save
        format.html { redirect_to(@naurse_duty_transfer, :notice => 'NaurseDutyTransfer was successfully created.') }
        format.xml  { render :xml => @naurse_duty_transfer, :status => :created, :location => @naurse_duty_transfer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @naurse_duty_transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /naurse_duty_transfers/1
  # PUT /naurse_duty_transfers/1.xml
  def update
    @naurse_duty_transfer = NaurseDutyTransfer.find(params[:id])

    respond_to do |format|
      if @naurse_duty_transfer.update_attributes(params[:naurse_duty_transfer])
        format.html { redirect_to(@naurse_duty_transfer, :notice => 'NaurseDutyTransfer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @naurse_duty_transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /naurse_duty_transfers/1
  # DELETE /naurse_duty_transfers/1.xml
  def destroy
    @naurse_duty_transfer = NaurseDutyTransfer.find(params[:id])
    @naurse_duty_transfer.destroy

    respond_to do |format|
      format.html { redirect_to(naurse_duty_transfers_url) }
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
