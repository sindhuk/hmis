class UsgtablesController < ApplicationController
  # GET /usgtables
  # GET /usgtables.xml
  def index
    @usgtables = Usgtable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usgtables }
    end
  end

  # GET /usgtables/1
  # GET /usgtables/1.xml
  def show
    @usgtable = Usgtable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usgtable }
    end
  end

  # GET /usgtables/new
  # GET /usgtables/new.xml
  def new
    @usgtable = Usgtable.new
	reg=params[:reg]
	if(reg)
		@usgtable.registration_no=reg
		@usgtable.mrno,@usgtable.billno,@usgtable.patientname=@usgtable.patient_data(reg)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usgtable }
    end
  end

  # GET /usgtables/1/edit
  def edit
    @usgtable = Usgtable.find(params[:id])
  end

  # POST /usgtables
  # POST /usgtables.xml
  def create
    @usgtable = Usgtable.new(params[:usgtable])

    respond_to do |format|
      if @usgtable.save
        format.html { redirect_to(@usgtable, :notice => 'Usgtable was successfully created.') }
        format.xml  { render :xml => @usgtable, :status => :created, :location => @usgtable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usgtable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usgtables/1
  # PUT /usgtables/1.xml
  def update
    @usgtable = Usgtable.find(params[:id])

    respond_to do |format|
      if @usgtable.update_attributes(params[:usgtable])
        format.html { redirect_to(@usgtable, :notice => 'Usgtable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usgtable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usgtables/1
  # DELETE /usgtables/1.xml
  def destroy
    @usgtable = Usgtable.find(params[:id])
    @usgtable.destroy

    respond_to do |format|
      format.html { redirect_to(usgtables_url) }
      format.xml  { head :ok }
    end
  end
end
