class TestresultsController < ApplicationController
  # GET /testresults
  # GET /testresults.xml
  def index
    @testresults = Testresult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testresults }
    end
  end

  # GET /testresults/1
  # GET /testresults/1.xml
  def show
    @testresult = Testresult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testresult }
    end
  end

  # GET /testresults/new
  # GET /testresults/new.xml
  def new
    @testresult = Testresult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testresult }
    end
  end

  # GET /testresults/1/edit
  def edit
    @testresult = Testresult.find(params[:id])
  end

  # POST /testresults
  # POST /testresults.xml
  def create
    @testresult = Testresult.new(params[:testresult])

    respond_to do |format|
      if @testresult.save
        format.html { redirect_to(@testresult, :notice => 'Testresult was successfully created.') }
        format.xml  { render :xml => @testresult, :status => :created, :location => @testresult }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testresult.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testresults/1
  # PUT /testresults/1.xml
  def update
    @testresult = Testresult.find(params[:id])

    respond_to do |format|
      if @testresult.update_attributes(params[:testresult])
        format.html { redirect_to(@testresult, :notice => 'Testresult was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testresult.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testresults/1
  # DELETE /testresults/1.xml
  def destroy
    @testresult = Testresult.find(params[:id])
    @testresult.destroy

    respond_to do |format|
      format.html { redirect_to(testresults_url) }
      format.xml  { head :ok }
    end
  end
end
