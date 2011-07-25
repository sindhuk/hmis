class BedChangesController < ApplicationController
  # GET /bed_changes
  # GET /bed_changes.xml
  def index
    @bed_changes = BedChange.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bed_changes }
    end
  end

  # GET /bed_changes/1
  # GET /bed_changes/1.xml
  def show
    @bed_change = BedChange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bed_change }
    end
  end

  # GET /bed_changes/new
  # GET /bed_changes/new.xml
  def new
    @bed_change = BedChange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bed_change }
    end
  end

  # GET /bed_changes/1/edit
  def edit
    @bed_change = BedChange.find(params[:id])
  end

  # POST /bed_changes
  # POST /bed_changes.xml
  def create
    @bed_change = BedChange.new(params[:bed_change])

    respond_to do |format|
      if @bed_change.save
        format.html { redirect_to(@bed_change, :notice => 'BedChange was successfully created.') }
        format.xml  { render :xml => @bed_change, :status => :created, :location => @bed_change }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bed_change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bed_changes/1
  # PUT /bed_changes/1.xml
  def update
    @bed_change = BedChange.find(params[:id])

    respond_to do |format|
      if @bed_change.update_attributes(params[:bed_change])
        format.html { redirect_to(@bed_change, :notice => 'BedChange was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bed_change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bed_changes/1
  # DELETE /bed_changes/1.xml
  def destroy
    @bed_change = BedChange.find(params[:id])
    @bed_change.destroy

    respond_to do |format|
      format.html { redirect_to(bed_changes_url) }
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
