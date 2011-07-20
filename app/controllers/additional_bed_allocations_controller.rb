class AdditionalBedAllocationsController < ApplicationController
  # GET /additional_bed_allocations
  # GET /additional_bed_allocations.xml
  def index
    @additional_bed_allocations = AdditionalBedAllocation.all
	@v= Verify.new
	@value=@v.retrive("Additional Bed Allocation")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @additional_bed_allocations }
    end
  end

  # GET /additional_bed_allocations/1
  # GET /additional_bed_allocations/1.xml
  def show
    @additional_bed_allocation = AdditionalBedAllocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @additional_bed_allocation }
    end
  end

  # GET /additional_bed_allocations/new
  # GET /additional_bed_allocations/new.xml
  def new
    @additional_bed_allocation = AdditionalBedAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @additional_bed_allocation }
    end
  end

  # GET /additional_bed_allocations/1/edit
  def edit
    @additional_bed_allocation = AdditionalBedAllocation.find(params[:id])
  end

  # POST /additional_bed_allocations
  # POST /additional_bed_allocations.xml
  def create
    @additional_bed_allocation = AdditionalBedAllocation.new(params[:additional_bed_allocation])

    respond_to do |format|
      if @additional_bed_allocation.save
        format.html { redirect_to(@additional_bed_allocation, :notice => 'AdditionalBedAllocation was successfully created.') }
        format.xml  { render :xml => @additional_bed_allocation, :status => :created, :location => @additional_bed_allocation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @additional_bed_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /additional_bed_allocations/1
  # PUT /additional_bed_allocations/1.xml
  def update
    @additional_bed_allocation = AdditionalBedAllocation.find(params[:id])

    respond_to do |format|
      if @additional_bed_allocation.update_attributes(params[:additional_bed_allocation])
        format.html { redirect_to(@additional_bed_allocation, :notice => 'AdditionalBedAllocation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @additional_bed_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_bed_allocations/1
  # DELETE /additional_bed_allocations/1.xml
  def destroy
    @additional_bed_allocation = AdditionalBedAllocation.find(params[:id])
    @additional_bed_allocation.destroy

    respond_to do |format|
      format.html { redirect_to(additional_bed_allocations_url) }
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
