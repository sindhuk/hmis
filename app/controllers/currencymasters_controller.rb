class CurrencymastersController < ApplicationController
  # GET /currencymasters
  # GET /currencymasters.xml
  def index
    @currencymasters = Currencymaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencymasters }
    end
  end

  # GET /currencymasters/1
  # GET /currencymasters/1.xml
  def show
    @currencymaster = Currencymaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currencymaster }
    end
  end

  # GET /currencymasters/new
  # GET /currencymasters/new.xml
  def new
    @currencymaster = Currencymaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @currencymaster }
    end
  end

  # GET /currencymasters/1/edit
  def edit
    @currencymaster = Currencymaster.find(params[:id])
  end

  # POST /currencymasters
  # POST /currencymasters.xml
  def create
    @currencymaster = Currencymaster.new(params[:currencymaster])

    respond_to do |format|
      if @currencymaster.save
        format.html { redirect_to(@currencymaster, :notice => 'Currencymaster was successfully created.') }
        format.xml  { render :xml => @currencymaster, :status => :created, :location => @currencymaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @currencymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /currencymasters/1
  # PUT /currencymasters/1.xml
  def update
    @currencymaster = Currencymaster.find(params[:id])

    respond_to do |format|
      if @currencymaster.update_attributes(params[:currencymaster])
        format.html { redirect_to(@currencymaster, :notice => 'Currencymaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @currencymaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /currencymasters/1
  # DELETE /currencymasters/1.xml
  def destroy
    @currencymaster = Currencymaster.find(params[:id])
    @currencymaster.destroy

    respond_to do |format|
      format.html { redirect_to(currencymasters_url) }
      format.xml  { head :ok }
    end
  end
end
