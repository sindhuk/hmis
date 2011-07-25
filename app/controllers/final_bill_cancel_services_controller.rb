class FinalBillCancelServicesController < ApplicationController
  # GET /final_bill_cancel_services
  # GET /final_bill_cancel_services.xml
  def index
    @final_bill_cancel_services = FinalBillCancelService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @final_bill_cancel_services }
    end
  end

  # GET /final_bill_cancel_services/1
  # GET /final_bill_cancel_services/1.xml
  def show
    @final_bill_cancel_service = FinalBillCancelService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @final_bill_cancel_service }
    end
  end

  # GET /final_bill_cancel_services/new
  # GET /final_bill_cancel_services/new.xml
  def new
    @final_bill_cancel_service = FinalBillCancelService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @final_bill_cancel_service }
    end
  end

  # GET /final_bill_cancel_services/1/edit
  def edit
    @final_bill_cancel_service = FinalBillCancelService.find(params[:id])
  end

  # POST /final_bill_cancel_services
  # POST /final_bill_cancel_services.xml
  def create
    @final_bill_cancel_service = FinalBillCancelService.new(params[:final_bill_cancel_service])

    respond_to do |format|
      if @final_bill_cancel_service.save
        format.html { redirect_to(@final_bill_cancel_service, :notice => 'FinalBillCancelService was successfully created.') }
        format.xml  { render :xml => @final_bill_cancel_service, :status => :created, :location => @final_bill_cancel_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @final_bill_cancel_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /final_bill_cancel_services/1
  # PUT /final_bill_cancel_services/1.xml
  def update
    @final_bill_cancel_service = FinalBillCancelService.find(params[:id])

    respond_to do |format|
      if @final_bill_cancel_service.update_attributes(params[:final_bill_cancel_service])
        format.html { redirect_to(@final_bill_cancel_service, :notice => 'FinalBillCancelService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @final_bill_cancel_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /final_bill_cancel_services/1
  # DELETE /final_bill_cancel_services/1.xml
  def destroy
    @final_bill_cancel_service = FinalBillCancelService.find(params[:id])
    @final_bill_cancel_service.destroy

    respond_to do |format|
      format.html { redirect_to(final_bill_cancel_services_url) }
      format.xml  { head :ok }
    end
  end
end
