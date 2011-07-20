class ApproximateBillsController < ApplicationController
  # GET /approximate_bills
  # GET /approximate_bills.xml
  def index
    @approximate_bills = ApproximateBill.all
	@v= Verify.new
	@value=@v.retrive("Approximate Bill")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @approximate_bills }
    end
  end

  # GET /approximate_bills/1
  # GET /approximate_bills/1.xml
  def show
    @approximate_bill = ApproximateBill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @approximate_bill }
    end
  end

  # GET /approximate_bills/new
  # GET /approximate_bills/new.xml
  def new
    @approximate_bill = ApproximateBill.new
    1.times{ @approximate_bill.approximate_service.build }
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approximate_bill }
    end
  end

  # GET /approximate_bills/1/edit
  def edit
    @approximate_bill = ApproximateBill.find(params[:id])
  end

  # POST /approximate_bills
  # POST /approximate_bills.xml
  def create
    @approximate_bill = ApproximateBill.new(params[:approximate_bill])

    respond_to do |format|
      if @approximate_bill.save
        format.html { redirect_to(@approximate_bill, :notice => 'ApproximateBill was successfully created.') }
        format.xml  { render :xml => @approximate_bill, :status => :created, :location => @approximate_bill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approximate_bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /approximate_bills/1
  # PUT /approximate_bills/1.xml
  def update
    @approximate_bill = ApproximateBill.find(params[:id])

    respond_to do |format|
      if @approximate_bill.update_attributes(params[:approximate_bill])
        format.html { redirect_to(@approximate_bill, :notice => 'ApproximateBill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @approximate_bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /approximate_bills/1
  # DELETE /approximate_bills/1.xml
  def destroy
    @approximate_bill = ApproximateBill.find(params[:id])
    @approximate_bill.destroy

    respond_to do |format|
      format.html { redirect_to(approximate_bills_url) }
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
