class FinalBillCancelsController < ApplicationController
  # GET /final_bill_cancels
  # GET /final_bill_cancels.xml
  def index
    @final_bill_cancels = FinalBillCancel.all
	@v= Verify.new
	@value=@v.retrive("Final Bill Cancel")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @final_bill_cancels }
    end
  end

  # GET /final_bill_cancels/1
  # GET /final_bill_cancels/1.xml
  def show
    @final_bill_cancel = FinalBillCancel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @final_bill_cancel }
    end
  end

  # GET /final_bill_cancels/new
  # GET /final_bill_cancels/new.xml
  def new
    @final_bill_cancel = FinalBillCancel.new
    1.times{@final_bill_cancel.final_bill_cancel_service.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @final_bill_cancel }
    end
  end

  # GET /final_bill_cancels/1/edit
  def edit
    @final_bill_cancel = FinalBillCancel.find(params[:id])
  end

  # POST /final_bill_cancels
  # POST /final_bill_cancels.xml
  def create
    @final_bill_cancel = FinalBillCancel.new(params[:final_bill_cancel])

    respond_to do |format|
      if @final_bill_cancel.save
        format.html { redirect_to(@final_bill_cancel, :notice => 'FinalBillCancel was successfully created.') }
        format.xml  { render :xml => @final_bill_cancel, :status => :created, :location => @final_bill_cancel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @final_bill_cancel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /final_bill_cancels/1
  # PUT /final_bill_cancels/1.xml
  def update
    @final_bill_cancel = FinalBillCancel.find(params[:id])

    respond_to do |format|
      if @final_bill_cancel.update_attributes(params[:final_bill_cancel])
        format.html { redirect_to(@final_bill_cancel, :notice => 'FinalBillCancel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @final_bill_cancel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /final_bill_cancels/1
  # DELETE /final_bill_cancels/1.xml
  def destroy
    @final_bill_cancel = FinalBillCancel.find(params[:id])
    @final_bill_cancel.destroy

    respond_to do |format|
      format.html { redirect_to(final_bill_cancels_url) }
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
		
		 def ajax_buildings1
		mr=params[:q]
		@test = Testmaster.find_by_test_name(mr)
		render :text => @test.fee.to_s
	end
end
