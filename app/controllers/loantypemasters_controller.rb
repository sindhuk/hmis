class LoantypemastersController < ApplicationController
  # GET /loantypemasters
  # GET /loantypemasters.xml
  def index
    @loantypemasters = Loantypemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loantypemasters }
    end
  end

  # GET /loantypemasters/1
  # GET /loantypemasters/1.xml
  def show
    @loantypemaster = Loantypemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loantypemaster }
    end
  end

  # GET /loantypemasters/new
  # GET /loantypemasters/new.xml
  def new
    @loantypemaster = Loantypemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loantypemaster }
    end
  end

  # GET /loantypemasters/1/edit
  def edit
    @loantypemaster = Loantypemaster.find(params[:id])
  end

  # POST /loantypemasters
  # POST /loantypemasters.xml
  def create
    @loantypemaster = Loantypemaster.new(params[:loantypemaster])

    respond_to do |format|
      if @loantypemaster.save
        format.html { redirect_to(@loantypemaster, :notice => 'Loantypemaster was successfully created.') }
        format.xml  { render :xml => @loantypemaster, :status => :created, :location => @loantypemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loantypemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loantypemasters/1
  # PUT /loantypemasters/1.xml
  def update
    @loantypemaster = Loantypemaster.find(params[:id])

    respond_to do |format|
      if @loantypemaster.update_attributes(params[:loantypemaster])
        format.html { redirect_to(@loantypemaster, :notice => 'Loantypemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loantypemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loantypemasters/1
  # DELETE /loantypemasters/1.xml
  def destroy
    @loantypemaster = Loantypemaster.find(params[:id])
    @loantypemaster.destroy

    respond_to do |format|
      format.html { redirect_to(loantypemasters_url) }
      format.xml  { head :ok }
    end
  end
end
