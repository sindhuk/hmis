class ConsultationformsController < ApplicationController
  # GET /consultationforms
  # GET /consultationforms.xml
  def index
    @consultationforms = Consultationform.all
	@v= Verify.new
	@value=@v.retrive("Consultation")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultationforms }
    end
  end

  # GET /consultationforms/1
  # GET /consultationforms/1.xml
  def show
    @consultationform = Consultationform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consultationform }
    end
  end

  # GET /consultationforms/new
  # GET /consultationforms/new.xml
  def new
    @consultationform = Consultationform.new
	mrn=params[:mrno]
	@consultationform.mr_no=mrn
	if(mrn)
		@consultationform.firstname,@consultationform.lastname,@consultationform.fathername,@consultationform.gender,@consultationform.age,@consultationform.address = @consultationform.incre(mrn) 
		
	end
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consultationform }
	  
    end
  end

  # GET /consultationforms/1/edit
  def edit
    @consultationform = Consultationform.find(params[:id])
  end

  # POST /consultationforms
  # POST /consultationforms.xml
  def create
    @consultationform = Consultationform.new(params[:consultationform])
    respond_to do |format|
      if @consultationform.save
		@n=Number.find_by_names("consultation")
		@n.value=@consultationform.consultation_no
		@n.update_attributes(params[:n])
		@n=Number.find_by_names("reciept")
		@n.value=@consultationform.receipt_no
		@n.update_attributes(params[:n])
        format.html { redirect_to(@consultationform, :notice => 'Consultationform was successfully created.') }
        format.xml  { render :xml => @consultationform, :status => :created, :location => @consultationform }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consultationform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultationforms/1
  # PUT /consultationforms/1.xml
  def update
    @consultationform = Consultationform.find(params[:id])

    respond_to do |format|
      if @consultationform.update_attributes(params[:consultationform])
        format.html { redirect_to(@consultationform, :notice => 'Consultationform was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consultationform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultationforms/1
  # DELETE /consultationforms/1.xml
  def destroy
    @consultationform = Consultationform.find(params[:id])
    @consultationform.destroy

    respond_to do |format|
      format.html { redirect_to(consultationforms_url) }
      format.xml  { head :ok }
    end
  end
  
  def ajax_buildings
		mr=params[:q]
			type=params[:type]
			if(type=="mr_no")
				@pa=PatientregistrationData.find_by_mr_no(mr)
				@n=Number.new
				@Update_value=@n.retrive_value("consultation") 
				@Update_reciept_value=@n.retrive_value("reciept")
				render :text => @pa.first_name+","+@pa.last_name+","+@pa.father_name+","+@pa.gender+","+@pa.age.to_s+","+@pa.address1+","+@Update_value.to_s+","+@Update_reciept_value.to_s
			elsif(type=="depart")
			@da=Doctormaster.find_by_department(mr)
			render :text => @da.name+","+@da.fee.to_s
		end
  end
  
  def printable_list_csv
      @ip=Consultationform.new()
	  @data=@ip.return_key
	  pdf = PatientregistrationDataReport.render_csv(:mrno => @data)
      send_data pdf, :type => "text/csv",
                     :filename => "OpConsultation.csv"
  end	
  
  def report
  end
  
end
