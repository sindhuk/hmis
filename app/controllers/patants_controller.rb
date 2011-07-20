class PatantsController < ApplicationController
  # GET /patants
  # GET /patants.xml
  def index
    @patants = Patant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patants }
    end
  end

  # GET /patants/1
  # GET /patants/1.xml
  def show
    @patant = Patant.find(params[:id])
     
	
	
	   puts @patant.appointments[0].apdate
	    puts @patant.physicians[0].d_name
	    
	  
	

	  
	 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patant }
    end
  end

  # GET /patants/new
  # GET /patants/new.xml
  def new
    @patant = Patant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patant }
    end
  end

  # GET /patants/1/edit
  def edit
    @patant = Patant.find(params[:id])
  end

  # POST /patants
  # POST /patants.xml
  def create
    @patant = Patant.new(params[:patant])

    respond_to do |format|
      if @patant.save
        format.html { redirect_to(@patant, :notice => 'Patant was successfully created.') }
        format.xml  { render :xml => @patant, :status => :created, :location => @patant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patants/1
  # PUT /patants/1.xml
  def update
    @patant = Patant.find(params[:id])

    respond_to do |format|
      if @patant.update_attributes(params[:patant])
        format.html { redirect_to(@patant, :notice => 'Patant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patants/1
  # DELETE /patants/1.xml
  def destroy
    @patant = Patant.find(params[:id])
    @patant.destroy

    respond_to do |format|
      format.html { redirect_to(patants_url) }
      format.xml  { head :ok }
    end
  end
end
