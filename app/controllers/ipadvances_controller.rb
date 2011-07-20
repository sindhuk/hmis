class IpadvancesController < ApplicationController
  # GET /ipadvances
  # GET /ipadvances.xml
  def index
    @ipadvances = Ipadvance.all
	@v= Verify.new
	@value=@v.retrive("IP Advances")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ipadvances }
    end
  end

  # GET /ipadvances/1
  # GET /ipadvances/1.xml
  def show
    @ipadvance = Ipadvance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ipadvance }
    end
  end

  # GET /ipadvances/new
  # GET /ipadvances/new.xml
  def new
    @ipadvance = Ipadvance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ipadvance }
    end
  end

  # GET /ipadvances/1/edit
  def edit
    @ipadvance = Ipadvance.find(params[:id])
  end

  # POST /ipadvances
  # POST /ipadvances.xml
  def create
    @ipadvance = Ipadvance.new(params[:ipadvance])

    respond_to do |format|
      if @ipadvance.save
        format.html { redirect_to(@ipadvance, :notice => 'Ipadvance was successfully created.') }
        format.xml  { render :xml => @ipadvance, :status => :created, :location => @ipadvance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ipadvance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ipadvances/1
  # PUT /ipadvances/1.xml
  def update
    @ipadvance = Ipadvance.find(params[:id])

    respond_to do |format|
      if @ipadvance.update_attributes(params[:ipadvance])
        format.html { redirect_to(@ipadvance, :notice => 'Ipadvance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ipadvance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ipadvances/1
  # DELETE /ipadvances/1.xml
  def destroy
    @ipadvance = Ipadvance.find(params[:id])
    @ipadvance.destroy

    respond_to do |format|
      format.html { redirect_to(ipadvances_url) }
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
