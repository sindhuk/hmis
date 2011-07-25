class RefundmastersController < ApplicationController
  # GET /refundmasters
  # GET /refundmasters.xml
  def index
    @refundmasters = Refundmaster.all
	@v= Verify.new
	@value=@v.retrive("Refunds")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @refundmasters }
    end
  end

  # GET /refundmasters/1
  # GET /refundmasters/1.xml
  def show
    @refundmaster = Refundmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @refundmaster }
    end
  end

  # GET /refundmasters/new
  # GET /refundmasters/new.xml
  def new
    @refundmaster = Refundmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @refundmaster }
    end
  end

  # GET /refundmasters/1/edit
  def edit
    @refundmaster = Refundmaster.find(params[:id])
  end

  # POST /refundmasters
  # POST /refundmasters.xml
  def create
    @refundmaster = Refundmaster.new(params[:refundmaster])

    respond_to do |format|
      if @refundmaster.save
        format.html { redirect_to(@refundmaster, :notice => 'Refundmaster was successfully created.') }
        format.xml  { render :xml => @refundmaster, :status => :created, :location => @refundmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @refundmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /refundmasters/1
  # PUT /refundmasters/1.xml
  def update
    @refundmaster = Refundmaster.find(params[:id])

    respond_to do |format|
      if @refundmaster.update_attributes(params[:refundmaster])
        format.html { redirect_to(@refundmaster, :notice => 'Refundmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @refundmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /refundmasters/1
  # DELETE /refundmasters/1.xml
  def destroy
    @refundmaster = Refundmaster.find(params[:id])
    @refundmaster.destroy

    respond_to do |format|
      format.html { redirect_to(refundmasters_url) }
      format.xml  { head :ok }
    end
  end
	def ajax_buildings
			mr=params[:q]
			type1=params[:type]
			if(type1=="dept")
				str=""
				@dep=Departmentmaster.find_by_name(mr)
				@doc=Doctormaster.find(:all,:conditions => "departmentmaster_id = #{@dep.id}")
				for i in 0...@doc.length
				str <<@doc[i].name+","
				end
				puts "hi"
				puts str
				render :text => str	
				
			elsif(type1=="mrno")
				@pa=PatientregistrationData.find_by_mr_no(mr)
				render :text => @pa.first_name+","+@pa.date_of_birth.to_s+","+@pa.age.to_s
	
			end
	end
  
  
  
end
