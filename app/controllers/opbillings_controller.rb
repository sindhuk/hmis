class OpbillingsController < ApplicationController
  # GET /opbillings
  # GET /opbillings.xml
  def index
    @opbillings = Opbilling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opbillings }
    end
  end

  # GET /opbillings/1
  # GET /opbillings/1.xml
  def show
    @opbilling = Opbilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opbilling }
    end
  end

  # GET /opbillings/new
  # GET /opbillings/new.xml
  def new
    @opbilling = Opbilling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opbilling }
    end
  end

  # GET /opbillings/1/edit
  def edit
    @opbilling = Opbilling.find(params[:id])
  end

  # POST /opbillings
  # POST /opbillings.xml
  def create
    @opbilling = Opbilling.new(params[:opbilling])

    respond_to do |format|
      if @opbilling.save
        format.html { redirect_to(@opbilling, :notice => 'Opbilling was successfully created.') }
        format.xml  { render :xml => @opbilling, :status => :created, :location => @opbilling }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opbilling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opbillings/1
  # PUT /opbillings/1.xml
  def update
    @opbilling = Opbilling.find(params[:id])

    respond_to do |format|
      if @opbilling.update_attributes(params[:opbilling])
        format.html { redirect_to(@opbilling, :notice => 'Opbilling was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opbilling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opbillings/1
  # DELETE /opbillings/1.xml
  def destroy
    @opbilling = Opbilling.find(params[:id])
    @opbilling.destroy

    respond_to do |format|
      format.html { redirect_to(opbillings_url) }
      format.xml  { head :ok }
    end
  end
end
