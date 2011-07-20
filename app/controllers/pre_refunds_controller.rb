class PreRefundsController < ApplicationController
  # GET /pre_refunds
  # GET /pre_refunds.xml
  def index
    @pre_refunds = PreRefund.all
	@v= Verify.new
	@value=@v.retrive("Pre Refunds")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pre_refunds }
    end
  end

  # GET /pre_refunds/1
  # GET /pre_refunds/1.xml
  def show
    @pre_refund = PreRefund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pre_refund }
    end
  end

  # GET /pre_refunds/new
  # GET /pre_refunds/new.xml
  def new
    @pre_refund = PreRefund.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pre_refund }
    end
  end

  # GET /pre_refunds/1/edit
  def edit
    @pre_refund = PreRefund.find(params[:id])
  end

  # POST /pre_refunds
  # POST /pre_refunds.xml
  def create
    @pre_refund = PreRefund.new(params[:pre_refund])

    respond_to do |format|
      if @pre_refund.save
        format.html { redirect_to(@pre_refund, :notice => 'PreRefund was successfully created.') }
        format.xml  { render :xml => @pre_refund, :status => :created, :location => @pre_refund }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pre_refund.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pre_refunds/1
  # PUT /pre_refunds/1.xml
  def update
    @pre_refund = PreRefund.find(params[:id])

    respond_to do |format|
      if @pre_refund.update_attributes(params[:pre_refund])
        format.html { redirect_to(@pre_refund, :notice => 'PreRefund was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pre_refund.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_refunds/1
  # DELETE /pre_refunds/1.xml
  def destroy
    @pre_refund = PreRefund.find(params[:id])
    @pre_refund.destroy

    respond_to do |format|
      format.html { redirect_to(pre_refunds_url) }
      format.xml  { head :ok }
    end
  end
   def ajax_buildings
		mr=params[:q]
		
		@pa=Ipadmission.find_by_mr_no(mr)
		if(@pa)
		render :text => @pa.reg_no+","+@pa.patient_name+","+@pa.father_name+","+@pa.floor+","+@pa.ward+","+@pa.room+","+@pa.bed 
		 else
		render :text =>"Invalid MR_NUMBER"
		end
		end
  
end
