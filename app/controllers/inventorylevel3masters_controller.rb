class Inventorylevel3mastersController < ApplicationController
  # GET /inventorylevel3masters
  # GET /inventorylevel3masters.xml
  def index
    @inventorylevel3masters = Inventorylevel3master.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventorylevel3masters }
    end
  end

  # GET /inventorylevel3masters/1
  # GET /inventorylevel3masters/1.xml
  def show
    @inventorylevel3master = Inventorylevel3master.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventorylevel3master }
    end
  end

  # GET /inventorylevel3masters/new
  # GET /inventorylevel3masters/new.xml
  def new
    @inventorylevel3master = Inventorylevel3master.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventorylevel3master }
    end
  end

  # GET /inventorylevel3masters/1/edit
  def edit
    @inventorylevel3master = Inventorylevel3master.find(params[:id])
  end

  # POST /inventorylevel3masters
  # POST /inventorylevel3masters.xml
  def create
    @inventorylevel3master = Inventorylevel3master.new(params[:inventorylevel3master])

    respond_to do |format|
      if @inventorylevel3master.save
        format.html { redirect_to(@inventorylevel3master, :notice => 'Inventorylevel3master was successfully created.') }
        format.xml  { render :xml => @inventorylevel3master, :status => :created, :location => @inventorylevel3master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventorylevel3master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventorylevel3masters/1
  # PUT /inventorylevel3masters/1.xml
  def update
    @inventorylevel3master = Inventorylevel3master.find(params[:id])

    respond_to do |format|
      if @inventorylevel3master.update_attributes(params[:inventorylevel3master])
        format.html { redirect_to(@inventorylevel3master, :notice => 'Inventorylevel3master was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inventorylevel3master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorylevel3masters/1
  # DELETE /inventorylevel3masters/1.xml
  def destroy
    @inventorylevel3master = Inventorylevel3master.find(params[:id])
    @inventorylevel3master.destroy

    respond_to do |format|
      format.html { redirect_to(inventorylevel3masters_url) }
      format.xml  { head :ok }
    end
  end
end
