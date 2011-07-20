class OpsearchesController < ApplicationController
  # GET /opsearches
  # GET /opsearches.xml
  def index
    @opsearches = Opsearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opsearches }
    end
  end

  # GET /opsearches/1
  # GET /opsearches/1.xml
  def show
    @opsearch = Opsearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opsearch }
    end
  end

  # GET /opsearches/new
  # GET /opsearches/new.xml
  def new
    @opsearch = Opsearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opsearch }
    end
  end

  # GET /opsearches/1/edit
  def edit
    @opsearch = Opsearch.find(params[:id])
  end

  # POST /opsearches
  # POST /opsearches.xml
  def create
    @opsearch = Opsearch.new(params[:opsearch])

    respond_to do |format|
      if @opsearch.save
        format.html { redirect_to(@opsearch, :notice => 'Opsearch was successfully created.') }
        format.xml  { render :xml => @opsearch, :status => :created, :location => @opsearch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opsearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opsearches/1
  # PUT /opsearches/1.xml
  def update
    @opsearch = Opsearch.find(params[:id])

    respond_to do |format|
      if @opsearch.update_attributes(params[:opsearch])
        format.html { redirect_to(@opsearch, :notice => 'Opsearch was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opsearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opsearches/1
  # DELETE /opsearches/1.xml
  def destroy
    @opsearch = Opsearch.find(params[:id])
    @opsearch.destroy

    respond_to do |format|
      format.html { redirect_to(opsearches_url) }
      format.xml  { head :ok }
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
		@ip=Consultationform.new()
		@ip.store_key(query)
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
			@patientinformation=Opbilling1.find(:all, :conditions => query)
			if(@patientinformation)
				render :partial => "opseach"
			else
				render :text => "Not Match"
			end
		end

  end
  
  
end
