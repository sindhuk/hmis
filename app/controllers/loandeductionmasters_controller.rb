class LoandeductionmastersController < ApplicationController
  # GET /loandeductionmasters
  # GET /loandeductionmasters.xml
  def index
    @loandeductionmasters = Loandeductionmaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loandeductionmasters }
    end
  end

  # GET /loandeductionmasters/1
  # GET /loandeductionmasters/1.xml
  def show
    @loandeductionmaster = Loandeductionmaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loandeductionmaster }
    end
  end

  # GET /loandeductionmasters/new
  # GET /loandeductionmasters/new.xml
  def new
    @loandeductionmaster = Loandeductionmaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loandeductionmaster }
    end
  end

  # GET /loandeductionmasters/1/edit
  def edit
    @loandeductionmaster = Loandeductionmaster.find(params[:id])
  end

  # POST /loandeductionmasters
  # POST /loandeductionmasters.xml
  def create
    @loandeductionmaster = Loandeductionmaster.new(params[:loandeductionmaster])

    respond_to do |format|
      if @loandeductionmaster.save
        format.html { redirect_to(@loandeductionmaster, :notice => 'Loandeductionmaster was successfully created.') }
        format.xml  { render :xml => @loandeductionmaster, :status => :created, :location => @loandeductionmaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loandeductionmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loandeductionmasters/1
  # PUT /loandeductionmasters/1.xml
  def update
    @loandeductionmaster = Loandeductionmaster.find(params[:id])

    respond_to do |format|
      if @loandeductionmaster.update_attributes(params[:loandeductionmaster])
        format.html { redirect_to(@loandeductionmaster, :notice => 'Loandeductionmaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loandeductionmaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loandeductionmasters/1
  # DELETE /loandeductionmasters/1.xml
  def destroy
    @loandeductionmaster = Loandeductionmaster.find(params[:id])
    @loandeductionmaster.destroy

    respond_to do |format|
      format.html { redirect_to(loandeductionmasters_url) }
      format.xml  { head :ok }
    end
  end
end
