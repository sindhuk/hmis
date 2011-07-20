class LoanpaymentmastersController < ApplicationController
  # GET /loanpaymentmasters
  # GET /loanpaymentmasters.xml
  def index
    @loanpaymentmasters = Loanpaymentmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loanpaymentmasters }
    end
  end

  # GET /loanpaymentmasters/1
  # GET /loanpaymentmasters/1.xml
  def show
    @loanpaymentmaster = Loanpaymentmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loanpaymentmaster }
    end
  end

  # GET /loanpaymentmasters/new
  # GET /loanpaymentmasters/new.xml
  def new
    @loanpaymentmaster = Loanpaymentmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loanpaymentmaster }
    end
  end

  # GET /loanpaymentmasters/1/edit
  def edit
    @loanpaymentmaster = Loanpaymentmaster.find(params[:id])
  end

  # POST /loanpaymentmasters
  # POST /loanpaymentmasters.xml
  def create
    @loanpaymentmaster = Loanpaymentmaster.new(params[:loanpaymentmaster])

    respond_to do |format|
      if @loanpaymentmaster.save
        format.html { redirect_to(@loanpaymentmaster, :notice => 'Loanpaymentmaster was successfully created.') }
        format.xml  { render :xml => @loanpaymentmaster, :status => :created, :location => @loanpaymentmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loanpaymentmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loanpaymentmasters/1
  # PUT /loanpaymentmasters/1.xml
  def update
    @loanpaymentmaster = Loanpaymentmaster.find(params[:id])

    respond_to do |format|
      if @loanpaymentmaster.update_attributes(params[:loanpaymentmaster])
        format.html { redirect_to(@loanpaymentmaster, :notice => 'Loanpaymentmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loanpaymentmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loanpaymentmasters/1
  # DELETE /loanpaymentmasters/1.xml
  def destroy
    @loanpaymentmaster = Loanpaymentmaster.find(params[:id])
    @loanpaymentmaster.destroy

    respond_to do |format|
      format.html { redirect_to(loanpaymentmasters_url) }
      format.xml  { head :ok }
    end
  end
end
