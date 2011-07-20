class TestmastersController < ApplicationController
  # GET /testmasters
  # GET /testmasters.xml
  def index
    @testmasters = Testmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testmasters }
    end
  end

  # GET /testmasters/1
  # GET /testmasters/1.xml
  def show
    @testmaster = Testmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testmaster }
    end
  end

  # GET /testmasters/new
  # GET /testmasters/new.xml
  def new
    @testmaster = Testmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testmaster }
    end
  end

  # GET /testmasters/1/edit
  def edit
    @testmaster = Testmaster.find(params[:id])
  end

  # POST /testmasters
  # POST /testmasters.xml
  def create
    @testmaster = Testmaster.new(params[:testmaster])

    respond_to do |format|
      if @testmaster.save
        format.html { redirect_to(@testmaster, :notice => 'Testmaster was successfully created.') }
        format.xml  { render :xml => @testmaster, :status => :created, :location => @testmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testmasters/1
  # PUT /testmasters/1.xml
  def update
    @testmaster = Testmaster.find(params[:id])

    respond_to do |format|
      if @testmaster.update_attributes(params[:testmaster])
        format.html { redirect_to(@testmaster, :notice => 'Testmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testmasters/1
  # DELETE /testmasters/1.xml
  def destroy
    @testmaster = Testmaster.find(params[:id])
    @testmaster.destroy

    respond_to do |format|
      format.html { redirect_to(testmasters_url) }
      format.xml  { head :ok }
    end
  end
end
