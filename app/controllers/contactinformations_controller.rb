class ContactinformationsController < ApplicationController
  # GET /contactinformations
  # GET /contactinformations.xml
  def index
    @contactinformations = Contactinformation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contactinformations }
    end
  end

  # GET /contactinformations/1
  # GET /contactinformations/1.xml
  def show
    @contactinformation = Contactinformation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contactinformation }
    end
  end

  # GET /contactinformations/new
  # GET /contactinformations/new.xml
  def new
    @contactinformation = Contactinformation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contactinformation }
    end
  end

  # GET /contactinformations/1/edit
  def edit
    @contactinformation = Contactinformation.find(params[:id])
  end

  # POST /contactinformations
  # POST /contactinformations.xml
  def create
    @contactinformation = Contactinformation.new(params[:contactinformation])

    respond_to do |format|
      if @contactinformation.save
        format.html { redirect_to(@contactinformation, :notice => 'Contactinformation was successfully created.') }
        format.xml  { render :xml => @contactinformation, :status => :created, :location => @contactinformation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contactinformation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contactinformations/1
  # PUT /contactinformations/1.xml
  def update
    @contactinformation = Contactinformation.find(params[:id])

    respond_to do |format|
      if @contactinformation.update_attributes(params[:contactinformation])
        format.html { redirect_to(@contactinformation, :notice => 'Contactinformation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contactinformation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contactinformations/1
  # DELETE /contactinformations/1.xml
  def destroy
    @contactinformation = Contactinformation.find(params[:id])
    @contactinformation.destroy

    respond_to do |format|
      format.html { redirect_to(contactinformations_url) }
      format.xml  { head :ok }
    end
  end
end
