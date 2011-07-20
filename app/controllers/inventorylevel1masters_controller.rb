class Inventorylevel1mastersController < ApplicationController
  # GET /inventorylevel1masters
  # GET /inventorylevel1masters.xml
  def index
    @inventorylevel1masters = Inventorylevel1master.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventorylevel1masters }
    end
  end

  # GET /inventorylevel1masters/1
  # GET /inventorylevel1masters/1.xml
  def show
    @inventorylevel1master = Inventorylevel1master.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventorylevel1master }
    end
  end

  # GET /inventorylevel1masters/new
  # GET /inventorylevel1masters/new.xml
  def new
    @inventorylevel1master = Inventorylevel1master.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventorylevel1master }
    end
  end

  # GET /inventorylevel1masters/1/edit
  def edit
    @inventorylevel1master = Inventorylevel1master.find(params[:id])
  end

  # POST /inventorylevel1masters
  # POST /inventorylevel1masters.xml
  def create
    @inventorylevel1master = Inventorylevel1master.new(params[:inventorylevel1master])

    respond_to do |format|
      if @inventorylevel1master.save
        format.html { redirect_to(@inventorylevel1master, :notice => 'Inventorylevel1master was successfully created.') }
        format.xml  { render :xml => @inventorylevel1master, :status => :created, :location => @inventorylevel1master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventorylevel1master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventorylevel1masters/1
  # PUT /inventorylevel1masters/1.xml
  def update
    @inventorylevel1master = Inventorylevel1master.find(params[:id])

    respond_to do |format|
      if @inventorylevel1master.update_attributes(params[:inventorylevel1master])
        format.html { redirect_to(@inventorylevel1master, :notice => 'Inventorylevel1master was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inventorylevel1master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorylevel1masters/1
  # DELETE /inventorylevel1masters/1.xml
  def destroy
    @inventorylevel1master = Inventorylevel1master.find(params[:id])
    @inventorylevel1master.destroy

    respond_to do |format|
      format.html { redirect_to(inventorylevel1masters_url) }
      format.xml  { head :ok }
    end
  end
end
