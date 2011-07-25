class FinalServicesController < ApplicationController
  # GET /final_services
  # GET /final_services.xml
  def index
    @final_services = FinalService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @final_services }
    end
  end

  # GET /final_services/1
  # GET /final_services/1.xml
  def show
    @final_service = FinalService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @final_service }
    end
  end

  # GET /final_services/new
  # GET /final_services/new.xml
  def new
    @final_service = FinalService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @final_service }
    end
  end

  # GET /final_services/1/edit
  def edit
    @final_service = FinalService.find(params[:id])
  end

  # POST /final_services
  # POST /final_services.xml
  def create
    @final_service = FinalService.new(params[:final_service])

    respond_to do |format|
      if @final_service.save
        format.html { redirect_to(@final_service, :notice => 'FinalService was successfully created.') }
        format.xml  { render :xml => @final_service, :status => :created, :location => @final_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @final_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /final_services/1
  # PUT /final_services/1.xml
  def update
    @final_service = FinalService.find(params[:id])

    respond_to do |format|
      if @final_service.update_attributes(params[:final_service])
        format.html { redirect_to(@final_service, :notice => 'FinalService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @final_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /final_services/1
  # DELETE /final_services/1.xml
  def destroy
    @final_service = FinalService.find(params[:id])
    @final_service.destroy

    respond_to do |format|
      format.html { redirect_to(final_services_url) }
      format.xml  { head :ok }
    end
  end
end
