class RetainBedsController < ApplicationController
  # GET /retain_beds
  # GET /retain_beds.xml
  def index
    @retain_beds = RetainBed.all
	@v= Verify.new
	@value=@v.retrive("Retain Bed")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @retain_beds }
    end
  end

  # GET /retain_beds/1
  # GET /retain_beds/1.xml
  def show
    @retain_bed = RetainBed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retain_bed }
    end
  end

  # GET /retain_beds/new
  # GET /retain_beds/new.xml
  def new
    @retain_bed = RetainBed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retain_bed }
    end
  end

  # GET /retain_beds/1/edit
  def edit
    @retain_bed = RetainBed.find(params[:id])
  end

  # POST /retain_beds
  # POST /retain_beds.xml
  def create
    @retain_bed = RetainBed.new(params[:retain_bed])

    respond_to do |format|
      if @retain_bed.save
        format.html { redirect_to(@retain_bed, :notice => 'RetainBed was successfully created.') }
        format.xml  { render :xml => @retain_bed, :status => :created, :location => @retain_bed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retain_bed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retain_beds/1
  # PUT /retain_beds/1.xml
  def update
    @retain_bed = RetainBed.find(params[:id])

    respond_to do |format|
      if @retain_bed.update_attributes(params[:retain_bed])
        format.html { redirect_to(@retain_bed, :notice => 'RetainBed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retain_bed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retain_beds/1
  # DELETE /retain_beds/1.xml
  def destroy
    @retain_bed = RetainBed.find(params[:id])
    @retain_bed.destroy

    respond_to do |format|
      format.html { redirect_to(retain_beds_url) }
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
