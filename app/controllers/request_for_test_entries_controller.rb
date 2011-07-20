class RequestForTestEntriesController < ApplicationController
  # GET /request_for_test_entries
  # GET /request_for_test_entries.xml
  def index
    @request_for_test_entries = RequestForTestEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @request_for_test_entries }
    end
  end

  # GET /request_for_test_entries/1
  # GET /request_for_test_entries/1.xml
  def show
    @request_for_test_entry = RequestForTestEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request_for_test_entry }
    end
  end

  # GET /request_for_test_entries/new
  # GET /request_for_test_entries/new.xml
  def new
    @request_for_test_entry = RequestForTestEntry.new
    1.times{ @request_for_test_entry.request_for_test_service.build }
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request_for_test_entry }
    end
  end

  # GET /request_for_test_entries/1/edit
  def edit
    @request_for_test_entry = RequestForTestEntry.find(params[:id])
  end

  # POST /request_for_test_entries
  # POST /request_for_test_entries.xml
  def create
    @request_for_test_entry = RequestForTestEntry.new(params[:request_for_test_entry])

    respond_to do |format|
      if @request_for_test_entry.save
        format.html { redirect_to(@request_for_test_entry, :notice => 'RequestForTestEntry was successfully created.') }
        format.xml  { render :xml => @request_for_test_entry, :status => :created, :location => @request_for_test_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request_for_test_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /request_for_test_entries/1
  # PUT /request_for_test_entries/1.xml
  def update
    @request_for_test_entry = RequestForTestEntry.find(params[:id])

    respond_to do |format|
      if @request_for_test_entry.update_attributes(params[:request_for_test_entry])
        format.html { redirect_to(@request_for_test_entry, :notice => 'RequestForTestEntry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request_for_test_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /request_for_test_entries/1
  # DELETE /request_for_test_entries/1.xml
  def destroy
    @request_for_test_entry = RequestForTestEntry.find(params[:id])
    @request_for_test_entry.destroy

    respond_to do |format|
      format.html { redirect_to(request_for_test_entries_url) }
      format.xml  { head :ok }
    end
  end
end
