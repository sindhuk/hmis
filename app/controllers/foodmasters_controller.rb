class FoodmastersController < ApplicationController
  # GET /foodmasters
  # GET /foodmasters.xml
  def index
    @foodmasters = Foodmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foodmasters }
    end
  end

  # GET /foodmasters/1
  # GET /foodmasters/1.xml
  def show
    @foodmaster = Foodmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foodmaster }
    end
  end

  # GET /foodmasters/new
  # GET /foodmasters/new.xml
  def new
    @foodmaster = Foodmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foodmaster }
    end
  end

  # GET /foodmasters/1/edit
  def edit
    @foodmaster = Foodmaster.find(params[:id])
  end

  # POST /foodmasters
  # POST /foodmasters.xml
  def create
    @foodmaster = Foodmaster.new(params[:foodmaster])

    respond_to do |format|
      if @foodmaster.save
        format.html { redirect_to(@foodmaster, :notice => 'Foodmaster was successfully created.') }
        format.xml  { render :xml => @foodmaster, :status => :created, :location => @foodmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foodmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /foodmasters/1
  # PUT /foodmasters/1.xml
  def update
    @foodmaster = Foodmaster.find(params[:id])

    respond_to do |format|
      if @foodmaster.update_attributes(params[:foodmaster])
        format.html { redirect_to(@foodmaster, :notice => 'Foodmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foodmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foodmasters/1
  # DELETE /foodmasters/1.xml
  def destroy
    @foodmaster = Foodmaster.find(params[:id])
    @foodmaster.destroy

    respond_to do |format|
      format.html { redirect_to(foodmasters_url) }
      format.xml  { head :ok }
    end
  end
end
