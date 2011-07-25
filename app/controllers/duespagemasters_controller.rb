class DuespagemastersController < ApplicationController
  # GET /duespagemasters
  # GET /duespagemasters.xml
  def index
    @duespagemasters = Duespagemaster.all
	@v= Verify.new
	@value=@v.retrive("Dues Payments")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @duespagemasters }
    end
  end

  # GET /duespagemasters/1
  # GET /duespagemasters/1.xml
  def show
    @duespagemaster = Duespagemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @duespagemaster }
    end
  end

  # GET /duespagemasters/new
  # GET /duespagemasters/new.xml
  def new
    @duespagemaster = Duespagemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @duespagemaster }
    end
  end

  # GET /duespagemasters/1/edit
  def edit
    @duespagemaster = Duespagemaster.find(params[:id])
  end

  # POST /duespagemasters
  # POST /duespagemasters.xml
  def create
    @duespagemaster = Duespagemaster.new(params[:duespagemaster])

    respond_to do |format|
      if @duespagemaster.save
        format.html { redirect_to(@duespagemaster, :notice => 'Duespagemaster was successfully created.') }
        format.xml  { render :xml => @duespagemaster, :status => :created, :location => @duespagemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @duespagemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /duespagemasters/1
  # PUT /duespagemasters/1.xml
  def update
    @duespagemaster = Duespagemaster.find(params[:id])

    respond_to do |format|
      if @duespagemaster.update_attributes(params[:duespagemaster])
        format.html { redirect_to(@duespagemaster, :notice => 'Duespagemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @duespagemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /duespagemasters/1
  # DELETE /duespagemasters/1.xml
  def destroy
    @duespagemaster = Duespagemaster.find(params[:id])
    @duespagemaster.destroy

    respond_to do |format|
      format.html { redirect_to(duespagemasters_url) }
      format.xml  { head :ok }
    end
  end
end
