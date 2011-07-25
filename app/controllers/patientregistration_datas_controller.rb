class PatientregistrationDatasController < ApplicationController
  # GET /patientregistration_datas
  # GET /patientregistration_datas.xml
  def index
    @patientregistration_datas = PatientregistrationData.all
	@v= Verify.new
	@value=@v.retrive("Registration")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patientregistration_datas }
    end
  end

  # GET /patientregistration_datas/1
  # GET /patientregistration_datas/1.xml
  def show
    @patientregistration_data = PatientregistrationData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patientregistration_data }
    end
  end

  # GET /patientregistration_datas/new
  # GET /patientregistration_datas/new.xml
  def new
    @patientregistration_data = PatientregistrationData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patientregistration_data }
    end
  end

  # GET /patientregistration_datas/1/edit
  def edit
    @patientregistration_data = PatientregistrationData.find(params[:id])
  end

  # POST /patientregistration_datas
  # POST /patientregistration_datas.xml
  def create
    @patientregistration_data = PatientregistrationData.new(params[:patientregistration_data])

    respond_to do |format|
      if @patientregistration_data.save
		@n=Number.find_by_names("reciept")
		@n.value=@patientregistration_data.reciept_no
		@n.update_attributes(params[:n])
        format.html { redirect_to("http://localhost:3000/patientregistration_datas/new") }
        format.xml  { render :xml => @patientregistration_data, :status => :created, :location => @patientregistration_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patientregistration_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patientregistration_datas/1
  # PUT /patientregistration_datas/1.xml
  def update
    @patientregistration_data = PatientregistrationData.find(params[:id])

    respond_to do |format|
      if @patientregistration_data.update_attributes(params[:patientregistration_data])
        format.html { redirect_to(@patientregistration_data, :notice => 'PatientregistrationData was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patientregistration_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patientregistration_datas/1
  # DELETE /patientregistration_datas/1.xml
  def destroy
    @patientregistration_data = PatientregistrationData.find(params[:id])
    @patientregistration_data.destroy

    respond_to do |format|
      format.html { redirect_to(patientregistration_datas_url) }
      format.xml  { head :ok }
    end
  end
  
  #Ajax Code
  def ajax_buildings
		mr=params[:q]
		type=params[:type]
		puts mr+"   "+type
		if(type=="city")
			@city=Citymaster.find_by_name(mr)
			@state=Statemaster.find_by_id(@city.statemaster_id)
			@country=Countrymaster.find_by_id(@state.countrymaster_id)
			render :text =>@state.name+","+@country.name
		elsif(type=="type")
			if ( mr=="New")
				@pa=PatientregistrationData.last
				if(@pa)
					n=(@pa.id+1).to_s
				else
					n=1.to_s
				end
				@n=Number.new
				@Update_reciept_value=@n.retrive_value("reciept")
				str=""
				for r in 0...(9-(n.length+2))
					str<<"0"
				end
				@newr="RG"<<str
				@newmr="MR"<<str
				@newr<<n
				@newmr<<n
				 render :text => @newr+","+@newmr+","+@Update_reciept_value.to_s
			else
				@pa=PatientregistrationData.find_by_mr_no(mr)
				if(@pa)
					d=@pa.reg_date.to_d
					valid=@pa.valid_period
					render :text => @pa.reg_no+","+@pa.first_name+","+@pa.last_name+","+@pa.father_name+","+@pa.age.to_s+","+@pa.disease+","+@pa.address1+","+@pa.address2+","+@pa.zipcode.to_s+","+@pa.city+","+@pa.state+","+@pa.country
				else
					render :text =>"Invalid MR_NUMBER"
				end
			end
		end
	end
	
	def mrno
		if(params[:type]=="mr")
			query=["mr_no Like ?",params[:q]+"%"]
		elsif(params[:type]=="reg")
			query=["reg_no Like ?",params[:q]+"%"]
		elsif(params[:type]=="mobile")
			query=["mobile_no Like ?",params[:q]+"%"]
		elsif(params[:type]=="Pname")
			query=["first_name Like ?",params[:q]+"%"]
		elsif(params[:type]=="Pname_Father")
			split_value=params[:q].split(',')
			query=["first_name like ? and father_name like ?",split_value[0]+"%",split_value[1]+"%"]
		elsif(params[:type]=="father")
			query=["father_name Like ?",params[:q]+"%"]
		elsif(params[:type]=="Father_Pname")
			split_value=params[:q].split(',')
			query=["first_name like ? and father_name like ?",split_value[0]+"%",split_value[1]+"%"]
		elsif(params[:type]=="city")
			query=["city = ?",params[:q]]
		elsif(params[:type]=="City_Pname")
			split_value=params[:q].split(',')
			query=["city = ? and first_name like ?",split_value[0],split_value[1]+"%"]
		elsif(params[:type]=="City_Father")
			split_value=params[:q].split(',')
			query=["city = ? and father_name like ?",split_value[0],split_value[1]+"%"]
		elsif(params[:type]=="City_Both")
			split_value=params[:q].split(',')
			query=["city = ? and first_name like ? and father_name like ?",split_value[0],split_value[1]+"%",split_value[2]+"%"]
		elsif(params[:type]=="gender")
			query=["gender = ?",params[:q]]
		end
		
		if(params[:option]=="cons")
			@patientinformation=PatientregistrationData.find(:all, :conditions => query)
			if(@patientinformation)
				render :partial => "mrseach"
			else
				render :text => "Not Match"
			end
		elsif(params[:option]=="OP")
			@opbilling=Opbilling1.find(:all, :conditions => query)
			if(@opbilling)
				render :partial => "opsearch"
			else
				render :text => "Not Match"
			end
		elsif(params[:option]=="OSP")
			@patientinformation=PatientregistrationData.find(:all, :conditions => query)
			if(@patientinformation)
				render :partial => "opseach"
			else
				render :text => "Not Match"
			end
		end

  end
  def fathername
		query=params[:q]
		@patientinformation=PatientinformationData.find(:all, :conditions => ["father_name LIKE ?", "#{query}%"])
		if(@patientinformation)
			render :partial => "match"
	   else
			render :text => "Not Match"
	   end

  end
  def firstname
		query=params[:q]
		@patientinformation=Patientinformation.find(:all, :conditions => ["first_name LIKE ?", "#{query}%"])
		if(@patientinformation)
			render :partial => "match"
	   else
			render :text => "Not Match"
	   end

  end
  def both_conditions
		
		query1=params[:q1]
		query2=params[:q2]
		puts query1
		puts query2
		@patientinformation=Patientinformation.find(:all, :conditions => ["first_name LIKE ? and father_name LIKE ?", "#{query1}%", "#{query2}%"])
		
		if(@patientinformation)
			render :partial => "match"
	   else
			render :text => "Not Match"
	   end

  end
  def city
		query=params[:city]
		
		@patientinformation=Contactinformation.find(:all, :conditions => ["city LIKE ?", "#{query}%"])
		if(@patientinformation)
			render :partial => "match"
	   else
			render :text => "Not Match"
	   end

  end
  def printable_list_csv
      @data_hash = params[:Mrno]
      @data = @data_hash[:mrno]
	  @patientregistration = PatientregistrationData.find_by_mr_no(@data)
	  name=@patientregistration.mr_no+".csv"
	  pdf = PatientregistrationDataReport.render_csv(:mrno => @data)
      send_data pdf, :type => "text/csv",
                     :filename => name 
  end
  def printable_list_pdf
	@data_hash = params[:Mrno]
    @data = @data_hash[:mrno]
	@patientregistration = PatientregistrationData.find_by_mr_no(@data)
	name=@patientregistration.mr_no+".pdf"
	pdf = PatientregistrationDataReport.render_pdf(:mrno => @data)
    send_data pdf, :type => "application/pdf",
                     :filename => name 
  end
end
