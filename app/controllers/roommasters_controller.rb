class RoommastersController < ApplicationController
  # GET /roommasters
  # GET /roommasters.xml
  def index
    @roommasters = Roommaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roommasters }
    end
  end

  # GET /roommasters/1
  # GET /roommasters/1.xml
  def show
    @roommaster = Roommaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @roommaster }
    end
  end

  # GET /roommasters/new
  # GET /roommasters/new.xml
  def new
    @roommaster = Roommaster.new
    @wardmasters = Wardmaster.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @roommaster }
    end
  end

  # GET /roommasters/1/edit
  def edit
    @roommaster = Roommaster.find(params[:id])
	@wardmasters = Wardmaster.find(:all)
  end

  # POST /roommasters
  # POST /roommasters.xml
  def create
    @roommaster = Roommaster.new(params[:roommaster])

    respond_to do |format|
      if @roommaster.save
        format.html { redirect_to(@roommaster, :notice => 'Roommaster was successfully created.') }
        format.xml  { render :xml => @roommaster, :status => :created, :location => @roommaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @roommaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roommasters/1
  # PUT /roommasters/1.xml
  def update
    @roommaster = Roommaster.find(params[:id])

    respond_to do |format|
      if @roommaster.update_attributes(params[:roommaster])
        format.html { redirect_to(@roommaster, :notice => 'Roommaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @roommaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roommasters/1
  # DELETE /roommasters/1.xml
  def destroy
    @roommaster = Roommaster.find(params[:id])
    @roommaster.destroy

    respond_to do |format|
      format.html { redirect_to(roommasters_url) }
      format.xml  { head :ok }
    end
  end
end
