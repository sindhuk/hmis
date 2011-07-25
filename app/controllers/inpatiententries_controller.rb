class InpatiententriesController < ApplicationController
  # GET /inpatiententries
  # GET /inpatiententries.xml
  def index
    @inpatiententries = Inpatiententry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inpatiententries }
    end
  end

  # GET /inpatiententries/1
  # GET /inpatiententries/1.xml
  def show
    @inpatiententry = Inpatiententry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inpatiententry }
    end
  end

  # GET /inpatiententries/new
  # GET /inpatiententries/new.xml
  def new
    @inpatiententry = Inpatiententry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inpatiententry }
    end
  end

  # GET /inpatiententries/1/edit
  def edit
    @inpatiententry = Inpatiententry.find(params[:id])
  end

  # POST /inpatiententries
  # POST /inpatiententries.xml
  def create
    @inpatiententry = Inpatiententry.new(params[:inpatiententry])

    respond_to do |format|
      if @inpatiententry.save
        format.html { redirect_to(@inpatiententry, :notice => 'Inpatiententry was successfully created.') }
        format.xml  { render :xml => @inpatiententry, :status => :created, :location => @inpatiententry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inpatiententry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inpatiententries/1
  # PUT /inpatiententries/1.xml
  def update
    @inpatiententry = Inpatiententry.find(params[:id])

    respond_to do |format|
      if @inpatiententry.update_attributes(params[:inpatiententry])
        format.html { redirect_to(@inpatiententry, :notice => 'Inpatiententry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inpatiententry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inpatiententries/1
  # DELETE /inpatiententries/1.xml
  def destroy
    @inpatiententry = Inpatiententry.find(params[:id])
    @inpatiententry.destroy

    respond_to do |format|
      format.html { redirect_to(inpatiententries_url) }
      format.xml  { head :ok }
    end
  end
end
