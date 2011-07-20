class XrayValuesController < ApplicationController
  # GET /xray_values
  # GET /xray_values.xml
  def index
    @xray_values = XrayValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @xray_values }
    end
  end

  # GET /xray_values/1
  # GET /xray_values/1.xml
  def show
    @xray_value = XrayValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @xray_value }
    end
  end

  # GET /xray_values/new
  # GET /xray_values/new.xml
  def new
    @xray_value = XrayValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @xray_value }
    end
  end

  # GET /xray_values/1/edit
  def edit
    @xray_value = XrayValue.find(params[:id])
  end

  # POST /xray_values
  # POST /xray_values.xml
  def create
    @xray_value = XrayValue.new(params[:xray_value])

    respond_to do |format|
      if @xray_value.save
        format.html { redirect_to(@xray_value, :notice => 'XrayValue was successfully created.') }
        format.xml  { render :xml => @xray_value, :status => :created, :location => @xray_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @xray_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /xray_values/1
  # PUT /xray_values/1.xml
  def update
    @xray_value = XrayValue.find(params[:id])

    respond_to do |format|
      if @xray_value.update_attributes(params[:xray_value])
        format.html { redirect_to(@xray_value, :notice => 'XrayValue was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @xray_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /xray_values/1
  # DELETE /xray_values/1.xml
  def destroy
    @xray_value = XrayValue.find(params[:id])
    @xray_value.destroy

    respond_to do |format|
      format.html { redirect_to(xray_values_url) }
      format.xml  { head :ok }
    end
  end
end
