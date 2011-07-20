class WardChangesController < ApplicationController
  # GET /ward_changes
  # GET /ward_changes.xml
  def index
    @ward_changes = WardChange.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ward_changes }
    end
  end

  # GET /ward_changes/1
  # GET /ward_changes/1.xml
  def show
    @ward_change = WardChange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ward_change }
    end
  end

  # GET /ward_changes/new
  # GET /ward_changes/new.xml
  def new
    @ward_change = WardChange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ward_change }
    end
  end

  # GET /ward_changes/1/edit
  def edit
    @ward_change = WardChange.find(params[:id])
  end

  # POST /ward_changes
  # POST /ward_changes.xml
  def create
    @ward_change = WardChange.new(params[:ward_change])

    respond_to do |format|
      if @ward_change.save
        format.html { redirect_to(@ward_change, :notice => 'WardChange was successfully created.') }
        format.xml  { render :xml => @ward_change, :status => :created, :location => @ward_change }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ward_change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ward_changes/1
  # PUT /ward_changes/1.xml
  def update
    @ward_change = WardChange.find(params[:id])

    respond_to do |format|
      if @ward_change.update_attributes(params[:ward_change])
        format.html { redirect_to(@ward_change, :notice => 'WardChange was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ward_change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ward_changes/1
  # DELETE /ward_changes/1.xml
  def destroy
    @ward_change = WardChange.find(params[:id])
    @ward_change.destroy

    respond_to do |format|
      format.html { redirect_to(ward_changes_url) }
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
