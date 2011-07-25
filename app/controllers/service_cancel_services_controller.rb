class ServiceCancelServicesController < ApplicationController
  # GET /service_cancel_services
  # GET /service_cancel_services.xml
  def index
    @service_cancel_services = ServiceCancelService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_cancel_services }
    end
  end

  # GET /service_cancel_services/1
  # GET /service_cancel_services/1.xml
  def show
    @service_cancel_service = ServiceCancelService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_cancel_service }
    end
  end

  # GET /service_cancel_services/new
  # GET /service_cancel_services/new.xml
  def new
    @service_cancel_service = ServiceCancelService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_cancel_service }
    end
  end

  # GET /service_cancel_services/1/edit
  def edit
    @service_cancel_service = ServiceCancelService.find(params[:id])
  end

  # POST /service_cancel_services
  # POST /service_cancel_services.xml
  def create
    @service_cancel_service = ServiceCancelService.new(params[:service_cancel_service])

    respond_to do |format|
      if @service_cancel_service.save
        format.html { redirect_to(@service_cancel_service, :notice => 'ServiceCancelService was successfully created.') }
        format.xml  { render :xml => @service_cancel_service, :status => :created, :location => @service_cancel_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_cancel_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_cancel_services/1
  # PUT /service_cancel_services/1.xml
  def update
    @service_cancel_service = ServiceCancelService.find(params[:id])

    respond_to do |format|
      if @service_cancel_service.update_attributes(params[:service_cancel_service])
        format.html { redirect_to(@service_cancel_service, :notice => 'ServiceCancelService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_cancel_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_cancel_services/1
  # DELETE /service_cancel_services/1.xml
  def destroy
    @service_cancel_service = ServiceCancelService.find(params[:id])
    @service_cancel_service.destroy

    respond_to do |format|
      format.html { redirect_to(service_cancel_services_url) }
      format.xml  { head :ok }
    end
  end
end
