class PostdiscountsController < ApplicationController
  # GET /postdiscounts
  # GET /postdiscounts.xml
  def index
    @postdiscounts = Postdiscount.all
	@v= Verify.new
	@value=@v.retrive("Post Discounts")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postdiscounts }
    end
  end

  # GET /postdiscounts/1
  # GET /postdiscounts/1.xml
  def show
    @postdiscount = Postdiscount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @postdiscount }
    end
  end

  # GET /postdiscounts/new
  # GET /postdiscounts/new.xml
  def new
    @postdiscount = Postdiscount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @postdiscount }
    end
  end

  # GET /postdiscounts/1/edit
  def edit
    @postdiscount = Postdiscount.find(params[:id])
  end

  # POST /postdiscounts
  # POST /postdiscounts.xml
  def create
    @postdiscount = Postdiscount.new(params[:postdiscount])

    respond_to do |format|
      if @postdiscount.save
        format.html { redirect_to(@postdiscount, :notice => 'Postdiscount was successfully created.') }
        format.xml  { render :xml => @postdiscount, :status => :created, :location => @postdiscount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @postdiscount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postdiscounts/1
  # PUT /postdiscounts/1.xml
  def update
    @postdiscount = Postdiscount.find(params[:id])

    respond_to do |format|
      if @postdiscount.update_attributes(params[:postdiscount])
        format.html { redirect_to(@postdiscount, :notice => 'Postdiscount was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @postdiscount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /postdiscounts/1
  # DELETE /postdiscounts/1.xml
  def destroy
    @postdiscount = Postdiscount.find(params[:id])
    @postdiscount.destroy

    respond_to do |format|
      format.html { redirect_to(postdiscounts_url) }
      format.xml  { head :ok }
    end
  end
end
