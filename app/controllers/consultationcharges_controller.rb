class ConsultationchargesController < ApplicationController
  # GET /consultationcharges
  # GET /consultationcharges.xml
  def index
    @consultationcharges = Consultationcharge.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultationcharges }
    end
  end

  # GET /consultationcharges/1
  # GET /consultationcharges/1.xml
  def show
    @consultationcharge = Consultationcharge.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consultationcharge }
    end
  end

  # GET /consultationcharges/new
  # GET /consultationcharges/new.xml
  def new
    @consultationcharge = Consultationcharge.new
    @doctormasters = Doctormaster.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consultationcharge }
    end
  end

  # GET /consultationcharges/1/edit
  def edit
    @consultationcharge = Consultationcharge.find(params[:id])
	@doctormasters = Doctormaster.find(:all)
  end

  # POST /consultationcharges
  # POST /consultationcharges.xml
  def create
    @consultationcharge = Consultationcharge.new(params[:consultationcharge])

    respond_to do |format|
      if @consultationcharge.save
        format.html { redirect_to(@consultationcharge, :notice => 'Consultationcharge was successfully created.') }
        format.xml  { render :xml => @consultationcharge, :status => :created, :location => @consultationcharge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consultationcharge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultationcharges/1
  # PUT /consultationcharges/1.xml
  def update
    @consultationcharge = Consultationcharge.find(params[:id])

    respond_to do |format|
      if @consultationcharge.update_attributes(params[:consultationcharge])
        format.html { redirect_to(@consultationcharge, :notice => 'Consultationcharge was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consultationcharge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultationcharges/1
  # DELETE /consultationcharges/1.xml
  def destroy
    @consultationcharge = Consultationcharge.find(params[:id])
    @consultationcharge.destroy

    respond_to do |format|
      format.html { redirect_to(consultationcharges_url) }
      format.xml  { head :ok }
    end
  end
end
