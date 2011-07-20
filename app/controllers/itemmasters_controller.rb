class ItemmastersController < ApplicationController
  # GET /itemmasters
  # GET /itemmasters.xml
  def index
    @itemmasters = Itemmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @itemmasters }
    end
  end

  # GET /itemmasters/1
  # GET /itemmasters/1.xml
  def show
    @itemmaster = Itemmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @itemmaster }
    end
  end

  # GET /itemmasters/new
  # GET /itemmasters/new.xml
  def new
    @itemmaster = Itemmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @itemmaster }
    end
  end

  # GET /itemmasters/1/edit
  def edit
    @itemmaster = Itemmaster.find(params[:id])
  end

  # POST /itemmasters
  # POST /itemmasters.xml
  def create
    @itemmaster = Itemmaster.new(params[:itemmaster])

    respond_to do |format|
      if @itemmaster.save
        format.html { redirect_to(@itemmaster, :notice => 'Itemmaster was successfully created.') }
        format.xml  { render :xml => @itemmaster, :status => :created, :location => @itemmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @itemmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itemmasters/1
  # PUT /itemmasters/1.xml
  def update
    @itemmaster = Itemmaster.find(params[:id])

    respond_to do |format|
      if @itemmaster.update_attributes(params[:itemmaster])
        format.html { redirect_to(@itemmaster, :notice => 'Itemmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @itemmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itemmasters/1
  # DELETE /itemmasters/1.xml
  def destroy
    @itemmaster = Itemmaster.find(params[:id])
    @itemmaster.destroy

    respond_to do |format|
      format.html { redirect_to(itemmasters_url) }
      format.xml  { head :ok }
    end
  end
end
