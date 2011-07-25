class FinalBillsController < ApplicationController
  # GET /final_bills
  # GET /final_bills.xml
  def index
    @final_bills = FinalBill.all
	@v= Verify.new
	@value=@v.retrive("Final Bill")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @final_bills }
    end
  end

  # GET /final_bills/1
  # GET /final_bills/1.xml
  def show
    @final_bill = FinalBill.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @final_bill }
    end
  end

  # GET /final_bills/new
  # GET /final_bills/new.xml
  def new
    @final_bill = FinalBill.new
     1.times{ @final_bill.final_service.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @final_bill }
    end
  end

  # GET /final_bills/1/edit
  def edit
    @final_bill = FinalBill.find(params[:id])
  end

  # POST /final_bills
  # POST /final_bills.xml
  def create
    @final_bill = FinalBill.new(params[:final_bill])

    respond_to do |format|
      if @final_bill.save
        format.html { redirect_to(@final_bill, :notice => 'FinalBill was successfully created.') }
        format.xml  { render :xml => @final_bill, :status => :created, :location => @final_bill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @final_bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /final_bills/1
  # PUT /final_bills/1.xml
  def update
    @final_bill = FinalBill.find(params[:id])

    respond_to do |format|
      if @final_bill.update_attributes(params[:final_bill])
        format.html { redirect_to(@final_bill, :notice => 'FinalBill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @final_bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /final_bills/1
  # DELETE /final_bills/1.xml
  def destroy
    @final_bill = FinalBill.find(params[:id])
    @final_bill.destroy

    respond_to do |format|
      format.html { redirect_to(final_bills_url) }
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
		render :text =>@test.test_code+","+@test.fee.to_s
	end	 
end
