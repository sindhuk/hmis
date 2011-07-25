class MedicinePagesController < ApplicationController
  # GET /medicine_pages
  # GET /medicine_pages.xml
  def index
    @medicine_pages = MedicinePage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medicine_pages }
    end
  end

  # GET /medicine_pages/1
  # GET /medicine_pages/1.xml
  def show
    @medicine_page = MedicinePage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medicine_page }
    end
  end

  # GET /medicine_pages/new
  # GET /medicine_pages/new.xml
  def new
    @medicine_page = MedicinePage.new
    1.times{@medicine_page.medicine_list.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medicine_page }
    end
  end

  # GET /medicine_pages/1/edit
  def edit
    @medicine_page = MedicinePage.find(params[:id])
  end

  # POST /medicine_pages
  # POST /medicine_pages.xml
  def create
    @medicine_page = MedicinePage.new(params[:medicine_page])

    respond_to do |format|
      if @medicine_page.save
        format.html { redirect_to(@medicine_page, :notice => 'MedicinePage was successfully created.') }
        format.xml  { render :xml => @medicine_page, :status => :created, :location => @medicine_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medicine_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medicine_pages/1
  # PUT /medicine_pages/1.xml
  def update
    @medicine_page = MedicinePage.find(params[:id])

    respond_to do |format|
      if @medicine_page.update_attributes(params[:medicine_page])
        format.html { redirect_to(@medicine_page, :notice => 'MedicinePage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medicine_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medicine_pages/1
  # DELETE /medicine_pages/1.xml
  def destroy
    @medicine_page = MedicinePage.find(params[:id])
    @medicine_page.destroy

    respond_to do |format|
      format.html { redirect_to(medicine_pages_url) }
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
  def ajax_buildings1
		mr=params[:q]
		
		@pa=Medicinemaster.find_by_name(mr)
		if(@pa)
		render :text => @pa.name+","+@pa.code+","+@pa.batch_no+","+@pa.quantity.to_s+","+@pa.price.to_s+","+@pa.amount.to_s
		else
		render :text =>"Invalid MR_NUMBER"
		end
		end
end
