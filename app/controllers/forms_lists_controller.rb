class FormsListsController < ApplicationController
  # GET /forms_lists
  # GET /forms_lists.xml
  def index
    @forms_lists = FormsList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forms_lists }
    end
  end

  # GET /forms_lists/1
  # GET /forms_lists/1.xml
  def show
    @forms_list = FormsList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forms_list }
    end
  end

  # GET /forms_lists/new
  # GET /forms_lists/new.xml
  def new
    @forms_list = FormsList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forms_list }
    end
  end

  # GET /forms_lists/1/edit
  def edit
    @forms_list = FormsList.find(params[:id])
  end

  # POST /forms_lists
  # POST /forms_lists.xml
  def create
    @forms_list = FormsList.new(params[:forms_list])

    respond_to do |format|
      if @forms_list.save
        format.html { redirect_to(@forms_list, :notice => 'FormsList was successfully created.') }
        format.xml  { render :xml => @forms_list, :status => :created, :location => @forms_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forms_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forms_lists/1
  # PUT /forms_lists/1.xml
  def update
    @forms_list = FormsList.find(params[:id])

    respond_to do |format|
      if @forms_list.update_attributes(params[:forms_list])
        format.html { redirect_to(@forms_list, :notice => 'FormsList was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forms_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forms_lists/1
  # DELETE /forms_lists/1.xml
  def destroy
    @forms_list = FormsList.find(params[:id])
    @forms_list.destroy

    respond_to do |format|
      format.html { redirect_to(forms_lists_url) }
      format.xml  { head :ok }
    end
  end
end
