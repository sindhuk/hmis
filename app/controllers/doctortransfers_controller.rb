class DoctortransfersController < ApplicationController
  # GET /doctortransfers
  # GET /doctortransfers.xml
  def index
    @doctortransfers = Doctortransfer.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctortransfer }
    end
  end

  # GET /doctortransfers/1
  # GET /doctortransfers/1.xml
  def show
    @doctortransfer = Doctortransfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctortransfer }
    end
  end

  # GET /doctortransfers/new
  # GET /doctortransfers/new.xml
  def new
    @doctortransfer = Doctortransfer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctortransfer }
    end
  end

  # GET /doctortransfers/1/edit
  def edit
    @doctortransfer = Doctortransfer.find(params[:id])
  end

  # POST /doctortransfers
  # POST /doctortransfers.xml
  def create
    @doctortransfer = Doctortransfer.new(params[:doctortransfer])
	@doctor=Ipadmission.new
	@doctor.data_save(@doctortransfer.mr_no,@doctortransfer.doctor)
	respond_to do |format|
      if @doctortransfer.save
        format.html { redirect_to(@doctortransfer, :notice => 'Doctortransfer was successfully created.') }
        format.xml  { render :xml => @doctortransfer, :status => :created, :location => @doctortransfer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctortransfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctortransfers/1
  # PUT /doctortransfers/1.xml
  def update
    @doctortransfer = Doctortransfer.find(params[:id])

    respond_to do |format|
      if @doctortransfer.update_attributes(params[:doctortransfer])
        format.html { redirect_to(@doctortransfer, :notice => 'Doctortransfer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctortransfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctortransfers/1
  # DELETE /doctortransfers/1.xml
  def destroy
    @doctortransfer = Doctortransfer.find(params[:id])
    @doctortransfer.destroy

    respond_to do |format|
      format.html { redirect_to(doctortransfers_url) }
      format.xml  { head :ok }
    end
  end
  
   def ajax_buildings
		mr=params[:q]
		type=params[:type]
		if(type=="mr")
			@pa=Ipadmission.find_by_mr_no(mr)
			if(@pa)
				render :text => @pa.reg_no+","+@pa.patient_name+","+@pa.father_name+","+@pa.doctor 
			else
				render :text =>"Invalid MR_NUMBER"
			end
		else 
			str=""
			@dop=Doctormaster.find(:all, :conditions => "department = '#{mr}'")
			for i in 0...@dop.length
				str<<@dop[i].name+","
			end
			puts str
			render :text =>str
		end
	end 	
  
end
