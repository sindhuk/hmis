class IpadmissionsController < ApplicationController
  # GET /ipadmissions
  # GET /ipadmissions.xml
  def index
    @ipadmissions = Ipadmission.all
	@v= Verify.new
	@value=@v.retrive("IP Admission")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ipadmissions }
    end
  end

  # GET /ipadmissions/1
  # GET /ipadmissions/1.xml
  def show
    @ipadmission = Ipadmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ipadmission }
    end
  end

  # GET /ipadmissions/new
  # GET /ipadmissions/new.xml
  def new
    @ipadmission = Ipadmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ipadmission }
    end
  end

  # GET /ipadmissions/1/edit
  def edit
    @ipadmission = Ipadmission.find(params[:id])
  end

  # POST /ipadmissions
  # POST /ipadmissions.xml
  def create
    @ipadmission = Ipadmission.new(params[:ipadmission])
	puts @ipadmission.bed
	@bedmaster=Bedmaster.find_by_bed_name(@ipadmission.bed)
	@bedmaster.status=0
	@roommaster=Roommaster.find_by_room_entry(@ipadmission.room)
	beds=@roommaster.no_of_beds_in_room
	@roommaster.no_of_beds_in_room=beds.to_i-1
    respond_to do |format|
      if @ipadmission.save
		@bedmaster.update_attributes(params[:bedmaster])
		@roommaster.update_attributes(params[:roommaster])
        format.html { redirect_to(@ipadmission, :notice => 'Ipadmission was successfully created.') }
        format.xml  { render :xml => @ipadmission, :status => :created, :location => @ipadmission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ipadmission.errors, :status => :unprocessable_entity }
      end
    end
	
  end

  # PUT /ipadmissions/1
  # PUT /ipadmissions/1.xml
  def update
    @ipadmission = Ipadmission.find(params[:id])

    respond_to do |format|
      if @ipadmission.update_attributes(params[:ipadmission])
        format.html { redirect_to(@ipadmission, :notice => 'Ipadmission was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ipadmission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ipadmissions/1
  # DELETE /ipadmissions/1.xml
  def destroy
    @ipadmission = Ipadmission.find(params[:id])
    @ipadmission.destroy

    respond_to do |format|
      format.html { redirect_to(ipadmissions_url) }
      format.xml  { head :ok }
    end
  end
  
  
   def ajax_buildings
	mr=params[:q]
	type=params[:type]
	if(type=="mr")
		@pa=PatientregistrationData.find_by_mr_no(mr)
		@ipadmission=Ipadmission.last
		if(@pa)
			if(@ipadmission)
				@id=(@ipadmission.id+1).to_s
			else
				@id=1.to_s
			end
			str=""
			for r in 0...(9-(@id.length+2))
				str<<"0"
			end
			@newr="AD"<<str<<@id
			render :text => @newr+","+@pa.reg_no+","+@pa.first_name+","+@pa.father_name+","+@pa.mobile_no.to_s+","+@pa.address1 
		else
			render :text =>"Invalid MR_NUMBER"
		end
	elsif(type=="floor")
		@floor=Floormaster.find_by_floor_name(mr)
		@ward=Wardmaster.find(:all, :conditions => "floormaster_id = '#{@floor.id}'")
		str=""
		for i in 0...@ward.length
			if @ward[i].status==1
				str=str<<@ward[i].code+","
			end
		end
		render :text =>str
	elsif(type=="ward")
		@ward=Wardmaster.find_by_code(mr)
		@room=Roommaster.find(:all, :conditions => "wardmaster_id = '#{@ward.id}'")
		str=""
		for i in 0...@room.length
			if @room[i].no_of_beds_in_room.to_i > 0
				str=str<<@room[i].room_entry+","
			end
		end
		render :text =>str
	elsif(type=="room")
		@room=Roommaster.find_by_room_entry(mr)
		@bed=Bedmaster.find(:all, :conditions => "roommaster_id = '#{@room.id}'")
		str=""
		for i in 0...@bed.length
			if @bed[i].status == 1
				str=str<<@bed[i].bed_name+","
			end
		end
		render :text =>str
	elsif(type=="dept")
		puts mr
		str=""
		@dop=Doctormaster.find(:all, :conditions => "department = '#{mr}'")
		for i in 0...@dop.length
			str<<@dop[i].name+","
		end
		render :text =>str
	end
  end
  def bed_select
	mr=params[:q]
	puts mr
	@room=Roommaster.find_by_room_entry(mr)
	@bedmasters=Bedmaster.find(:all, :conditions => "roommaster_id = '#{@room.id}'")
  end
  def printable_list_csv
      @ip=Ipadmission.new()
	  @data=@ip.return_key
	  pdf = IpadmissionReport.render_csv(:mrno => @data)
      send_data pdf, :type => "text/csv",
                     :filename => "Ipadmission.csv"
  end	
  
  def report
  end
	
end
