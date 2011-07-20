class IpServicesController < ApplicationController
  # GET /ip_services
  # GET /ip_services.xml
  def index
    @ip_services = IpService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ip_services }
    end
  end

  # GET /ip_services/1
  # GET /ip_services/1.xml
  def show
    @ip_service = IpService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ip_service }
    end
  end

  # GET /ip_services/new
  # GET /ip_services/new.xml
  def new
    @ip_service = IpService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ip_service }
    end
  end

  # GET /ip_services/1/edit
  def edit
    @ip_service = IpService.find(params[:id])
  end

  # POST /ip_services
  # POST /ip_services.xml
  def create
    @ip_service = IpService.new(params[:ip_service])

    respond_to do |format|
      if @ip_service.save
        format.html { redirect_to(@ip_service, :notice => 'IpService was successfully created.') }
        format.xml  { render :xml => @ip_service, :status => :created, :location => @ip_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ip_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ip_services/1
  # PUT /ip_services/1.xml
  def update
    @ip_service = IpService.find(params[:id])

    respond_to do |format|
      if @ip_service.update_attributes(params[:ip_service])
        format.html { redirect_to(@ip_service, :notice => 'IpService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ip_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_services/1
  # DELETE /ip_services/1.xml
  def destroy
    @ip_service = IpService.find(params[:id])
    @ip_service.destroy

    respond_to do |format|
      format.html { redirect_to(ip_services_url) }
      format.xml  { head :ok }
    end
  end
end
