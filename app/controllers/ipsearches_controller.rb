class IpsearchesController < ApplicationController
  # GET /ipsearches
  # GET /ipsearches.xml
  def index
    @ipsearches = Ipsearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ipsearches }
    end
  end

  # GET /ipsearches/1
  # GET /ipsearches/1.xml
  def show
    @ipsearch = Ipsearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ipsearch }
    end
  end

  # GET /ipsearches/new
  # GET /ipsearches/new.xml
  def new
    @ipsearch = Ipsearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ipsearch }
    end
  end

  # GET /ipsearches/1/edit
  def edit
    @ipsearch = Ipsearch.find(params[:id])
  end

  # POST /ipsearches
  # POST /ipsearches.xml
  def create
    @ipsearch = Ipsearch.new(params[:ipsearch])

    respond_to do |format|
      if @ipsearch.save
        format.html { redirect_to(@ipsearch, :notice => 'Ipsearch was successfully created.') }
        format.xml  { render :xml => @ipsearch, :status => :created, :location => @ipsearch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ipsearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ipsearches/1
  # PUT /ipsearches/1.xml
  def update
    @ipsearch = Ipsearch.find(params[:id])

    respond_to do |format|
      if @ipsearch.update_attributes(params[:ipsearch])
        format.html { redirect_to(@ipsearch, :notice => 'Ipsearch was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ipsearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ipsearches/1
  # DELETE /ipsearches/1.xml
  def destroy
    @ipsearch = Ipsearch.find(params[:id])
    @ipsearch.destroy

    respond_to do |format|
      format.html { redirect_to(ipsearches_url) }
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
			query=["patient_name Like ?",params[:q]+"%"]
		elsif(params[:type]=="Pname_Father")
			split_value=params[:q].split(',')
			query=["patient_name like ? and father_name like ?",split_value[0]+"%",split_value[1]+"%"]
		elsif(params[:type]=="father")
			query=["father_name Like ?",params[:q]+"%"]
		elsif(params[:type]=="Father_Pname")
			split_value=params[:q].split(',')
			query=["patient_name like ? and father_name like ?",split_value[0]+"%",split_value[1]+"%"]
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
		@ip=Ipadmission.new()
		@ip.store_key(query)
		@ipadmission=Ipadmission.find(:all, :conditions => query)
		if(@ipadmission)
			render :partial => "mrseach"
		else
			render :text => "Not Match"
		end
  end
end
