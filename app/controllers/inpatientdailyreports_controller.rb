class InpatientdailyreportsController < ApplicationController
  # GET /inpatientdailyreports
  # GET /inpatientdailyreports.xml
  def index
    @inpatientdailyreports = Inpatientdailyreport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inpatientdailyreports }
    end
  end

  # GET /inpatientdailyreports/1
  # GET /inpatientdailyreports/1.xml
  def show
    @inpatientdailyreport = Inpatientdailyreport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inpatientdailyreport }
    end
  end

  # GET /inpatientdailyreports/new
  # GET /inpatientdailyreports/new.xml
  def new
    @inpatientdailyreport = Inpatientdailyreport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inpatientdailyreport }
    end
  end

  # GET /inpatientdailyreports/1/edit
  def edit
    @inpatientdailyreport = Inpatientdailyreport.find(params[:id])
  end

  # POST /inpatientdailyreports
  # POST /inpatientdailyreports.xml
  def create
    @inpatientdailyreport = Inpatientdailyreport.new(params[:inpatientdailyreport])

    respond_to do |format|
      if @inpatientdailyreport.save
        format.html { redirect_to(@inpatientdailyreport, :notice => 'Inpatientdailyreport was successfully created.') }
        format.xml  { render :xml => @inpatientdailyreport, :status => :created, :location => @inpatientdailyreport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inpatientdailyreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inpatientdailyreports/1
  # PUT /inpatientdailyreports/1.xml
  def update
    @inpatientdailyreport = Inpatientdailyreport.find(params[:id])

    respond_to do |format|
      if @inpatientdailyreport.update_attributes(params[:inpatientdailyreport])
        format.html { redirect_to(@inpatientdailyreport, :notice => 'Inpatientdailyreport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inpatientdailyreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inpatientdailyreports/1
  # DELETE /inpatientdailyreports/1.xml
  def destroy
    @inpatientdailyreport = Inpatientdailyreport.find(params[:id])
    @inpatientdailyreport.destroy

    respond_to do |format|
      format.html { redirect_to(inpatientdailyreports_url) }
      format.xml  { head :ok }
    end
  end
end
