class ApproximateServicesController < ApplicationController
  # GET /approximate_services
  # GET /approximate_services.xml
  def index
    @approximate_services = ApproximateService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @approximate_services }
    end
  end

  # GET /approximate_services/1
  # GET /approximate_services/1.xml
  def show
    @approximate_service = ApproximateService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @approximate_service }
    end
  end

  # GET /approximate_services/new
  # GET /approximate_services/new.xml
  def new
    @approximate_service = ApproximateService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approximate_service }
    end
  end

  # GET /approximate_services/1/edit
  def edit
    @approximate_service = ApproximateService.find(params[:id])
  end

  # POST /approximate_services
  # POST /approximate_services.xml
  def create
    @approximate_service = ApproximateService.new(params[:approximate_service])

    respond_to do |format|
      if @approximate_service.save
        format.html { redirect_to(@approximate_service, :notice => 'ApproximateService was successfully created.') }
        format.xml  { render :xml => @approximate_service, :status => :created, :location => @approximate_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approximate_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /approximate_services/1
  # PUT /approximate_services/1.xml
  def update
    @approximate_service = ApproximateService.find(params[:id])

    respond_to do |format|
      if @approximate_service.update_attributes(params[:approximate_service])
        format.html { redirect_to(@approximate_service, :notice => 'ApproximateService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @approximate_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /approximate_services/1
  # DELETE /approximate_services/1.xml
  def destroy
    @approximate_service = ApproximateService.find(params[:id])
    @approximate_service.destroy

    respond_to do |format|
      format.html { redirect_to(approximate_services_url) }
      format.xml  { head :ok }
    end
  end
end
