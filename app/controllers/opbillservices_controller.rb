class OpbillservicesController < ApplicationController
  # GET /opbillservices
  # GET /opbillservices.xml
  def index
    @opbillservices = Opbillservice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opbillservices }
    end
  end

  # GET /opbillservices/1
  # GET /opbillservices/1.xml
  def show
    @opbillservice = Opbillservice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opbillservice }
    end
  end

  # GET /opbillservices/new
  # GET /opbillservices/new.xml
  def new
    @opbillservice = Opbillservice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opbillservice }
    end
  end

  # GET /opbillservices/1/edit
  def edit
    @opbillservice = Opbillservice.find(params[:id])
  end

  # POST /opbillservices
  # POST /opbillservices.xml
  def create
    @opbillservice = Opbillservice.new(params[:opbillservice])

    respond_to do |format|
      if @opbillservice.save
        format.html { redirect_to(@opbillservice, :notice => 'Opbillservice was successfully created.') }
        format.xml  { render :xml => @opbillservice, :status => :created, :location => @opbillservice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opbillservice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opbillservices/1
  # PUT /opbillservices/1.xml
  def update
    @opbillservice = Opbillservice.find(params[:id])

    respond_to do |format|
      if @opbillservice.update_attributes(params[:opbillservice])
        format.html { redirect_to(@opbillservice, :notice => 'Opbillservice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opbillservice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opbillservices/1
  # DELETE /opbillservices/1.xml
  def destroy
    @opbillservice = Opbillservice.find(params[:id])
    @opbillservice.destroy

    respond_to do |format|
      format.html { redirect_to(opbillservices_url) }
      format.xml  { head :ok }
    end
  end
  
   def ajax_buildings
		@pa=PatientregistrationData.last
		@value=1000+@pa.id
		billno=params[:q]
		selectedid=params[:type]
		if(selectedid=="billno")
			@opbilling=Opbilling1.find_by_bill_no(billno)
			render :text =>@opbilling.bill_data
		else
			render :text =>@value.to_s
		end		
  end
		
  
end
