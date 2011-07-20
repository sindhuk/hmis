class InsurenceinformationsController < ApplicationController
  # GET /insurenceinformations
  # GET /insurenceinformations.xml
  def index
    @insurenceinformations = Insurenceinformation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurenceinformations }
    end
  end

  # GET /insurenceinformations/1
  # GET /insurenceinformations/1.xml
  def show
    @insurenceinformation = Insurenceinformation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurenceinformation }
    end
  end

  # GET /insurenceinformations/new
  # GET /insurenceinformations/new.xml
  def new
    @insurenceinformation = Insurenceinformation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurenceinformation }
    end
  end

  # GET /insurenceinformations/1/edit
  def edit
    @insurenceinformation = Insurenceinformation.find(params[:id])
  end

  # POST /insurenceinformations
  # POST /insurenceinformations.xml
  def create
    @insurenceinformation = Insurenceinformation.new(params[:insurenceinformation])

    respond_to do |format|
      if @insurenceinformation.save
        format.html { redirect_to(@insurenceinformation, :notice => 'Insurenceinformation was successfully created.') }
        format.xml  { render :xml => @insurenceinformation, :status => :created, :location => @insurenceinformation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurenceinformation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurenceinformations/1
  # PUT /insurenceinformations/1.xml
  def update
    @insurenceinformation = Insurenceinformation.find(params[:id])

    respond_to do |format|
      if @insurenceinformation.update_attributes(params[:insurenceinformation])
        format.html { redirect_to(@insurenceinformation, :notice => 'Insurenceinformation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurenceinformation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurenceinformations/1
  # DELETE /insurenceinformations/1.xml
  def destroy
    @insurenceinformation = Insurenceinformation.find(params[:id])
    @insurenceinformation.destroy

    respond_to do |format|
      format.html { redirect_to(insurenceinformations_url) }
      format.xml  { head :ok }
    end
  end
end
