class Inventorylevel2mastersController < ApplicationController
  # GET /inventorylevel2masters
  # GET /inventorylevel2masters.xml
  def index
    @inventorylevel2masters = Inventorylevel2master.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventorylevel2masters }
    end
  end

  # GET /inventorylevel2masters/1
  # GET /inventorylevel2masters/1.xml
  def show
    @inventorylevel2master = Inventorylevel2master.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventorylevel2master }
    end
  end

  # GET /inventorylevel2masters/new
  # GET /inventorylevel2masters/new.xml
  def new
    @inventorylevel2master = Inventorylevel2master.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventorylevel2master }
    end
  end

  # GET /inventorylevel2masters/1/edit
  def edit
    @inventorylevel2master = Inventorylevel2master.find(params[:id])
  end

  # POST /inventorylevel2masters
  # POST /inventorylevel2masters.xml
  def create
    @inventorylevel2master = Inventorylevel2master.new(params[:inventorylevel2master])

    respond_to do |format|
      if @inventorylevel2master.save
        format.html { redirect_to(@inventorylevel2master, :notice => 'Inventorylevel2master was successfully created.') }
        format.xml  { render :xml => @inventorylevel2master, :status => :created, :location => @inventorylevel2master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventorylevel2master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventorylevel2masters/1
  # PUT /inventorylevel2masters/1.xml
  def update
    @inventorylevel2master = Inventorylevel2master.find(params[:id])

    respond_to do |format|
      if @inventorylevel2master.update_attributes(params[:inventorylevel2master])
        format.html { redirect_to(@inventorylevel2master, :notice => 'Inventorylevel2master was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inventorylevel2master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorylevel2masters/1
  # DELETE /inventorylevel2masters/1.xml
  def destroy
    @inventorylevel2master = Inventorylevel2master.find(params[:id])
    @inventorylevel2master.destroy

    respond_to do |format|
      format.html { redirect_to(inventorylevel2masters_url) }
      format.xml  { head :ok }
    end
  end
end
