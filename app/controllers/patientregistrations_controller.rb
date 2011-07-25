class PatientregistrationsController < ApplicationController
  # GET /patientregistrations
  # GET /patientregistrations.xml
  def index
    @patientregistrations = Patientregistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patientregistrations }
    end
  end
  
  def report
  
  end

  # GET /patientregistrations/1
  # GET /patientregistrations/1.xml
  def show
	puts "enter"
    @data = params[:id]
	@patientregistration = Patientregistration.find_by_id(@data)
	respond_to do |format|
	  format.html # show.html.erb
	  format.xml  { render :xml => @patientregistration }
	end
 end

  # GET /patientregistrations/new
  # GET /patientregistrations/new.xml
  def new
    @patientregistration = Patientregistration.new
    1.times { @patientregistration.patientinformation.build }
	1.times { @patientregistration.patientappointmentinfo.build }
	1.times { @patientregistration.contactinformation.build }
	1.times { @patientregistration.insurenceinformation.build }
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patientregistration }
    end
  end
  
  
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
				@pa=Patientregistration.last
				n=(@pa.id+1).to_s
				str=""
				for r in 0...(9-(n.length+2))
					str<<"0"
				end
				@newr="RG"<<str
				@newmr="MR"<<str
				@newr<<n
				@newmr<<n
				 render :text => @newr+","+@newmr
			else
				@pa=Patientregistration.find_by_mr_no(mr)
				if(@pa)
					d=@pa.patientappointmentinfo[0].reg_date
					valid=@pa.patientinformation[0].valid_period
					mon=d>>valid.to_i-3
					puts mon<=>DateTime.now
					check=mon<=>DateTime.now
					puts DateTime.now
					puts mon
					if(check==-1)
						valid_date=((DateTime.now-mon).to_i).to_s
						render :text => @pa.patientappointmentinfo[0].registration_id+","+@pa.patientinformation[0].first_name+","+@pa.patientinformation[0].last_name+","+@pa.patientinformation[0].father_name+","+@pa.patientinformation[0].age+","+@pa.patientinformation[0].disease+","+@pa.contactinformation[0].address1+","+@pa.contactinformation[0].address2+","+@pa.contactinformation[0].zipcode+","+valid_date
					else
						render :text =>"Registration Expired" 
					end
				else
					render :text =>"Invalid MR_NUMBER"
				end
			end
		end
	end
  
  
  # GET /patientregistrations/1/edit
  def edit
    @patientregistration = Patientregistration.find(params[:id])
  end

  # POST /patientregistrations
  # POST /patientregistrations.xml
  def create
    @patientregistration = Patientregistration.new(params[:patientregistration])

    respond_to do |format|
      if @patientregistration.save
        format.html { redirect_to("http://localhost:3000/patientregistrations/new") }
        format.xml  { render :xml => @patientregistration, :status => :created, :location => @patientregistration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patientregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patientregistrations/1
  # PUT /patientregistrations/1.xml
  def update
    @patientregistration = Patientregistration.find(params[:id])

    respond_to do |format|
      if @patientregistration.update_attributes(params[:patientregistration])
        format.html { redirect_to(@patientregistration, :notice => 'Patientregistration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patientregistration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patientregistrations/1
  # DELETE /patientregistrations/1.xml
  def destroy
    @patientregistration = Patientregistration.find(params[:id])
    @patientregistration.destroy

    respond_to do |format|
      format.html { redirect_to(patientregistrations_url) }
      format.xml  { head :ok }
    end
  end
  
  def mrno
		query=params[:q]
		@patientinformation=Patientregistration.find(:all, :conditions => ["mr_no LIKE ?", "#{query}%"])
		if(@patientinformation)
			render :partial => "mrseach"
		else
			render :text => "Not Match"
		end

  end
  def fathername
		query=params[:q]
		@patientinformation=Patientinformation.find(:all, :conditions => ["father_name LIKE ?", "#{query}%"])
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
      pdf = CountrymasterReport.render_csv
	  @countrymaster = Countrymaster.find(params[:id])
	  name=@countrymaster.name+".csv"
      send_data pdf, :type => "text/csv",
                     :filename => name 
  end
  def printable_list_pdf
	@data_hash = params[:Mrno]
    @data = @data_hash[:mrno]
	@patientregistration = Patientregistration.find_by_mr_no(@data)
	name=@patientregistration.mr_no+".pdf"
	pdf = PatientregistrationReport.render_pdf(:mrno => @data)
    send_data pdf, :type => "application/pdf",
                     :filename => name 
  end
end
