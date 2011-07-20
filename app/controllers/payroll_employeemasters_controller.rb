class PayrollEmployeemastersController < ApplicationController
  # GET /payroll_employeemasters
  # GET /payroll_employeemasters.xml
  def index
    @payroll_employeemasters = PayrollEmployeemaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payroll_employeemasters }
    end
  end

  # GET /payroll_employeemasters/1
  # GET /payroll_employeemasters/1.xml
  def show
    @payroll_employeemaster = PayrollEmployeemaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payroll_employeemaster }
    end
  end

  # GET /payroll_employeemasters/new
  # GET /payroll_employeemasters/new.xml
  def new
    @payroll_employeemaster = PayrollEmployeemaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payroll_employeemaster }
    end
  end

  # GET /payroll_employeemasters/1/edit
  def edit
    @payroll_employeemaster = PayrollEmployeemaster.find(params[:id])
  end

  # POST /payroll_employeemasters
  # POST /payroll_employeemasters.xml
  def create
    @payroll_employeemaster = PayrollEmployeemaster.new(params[:payroll_employeemaster])

    respond_to do |format|
      if @payroll_employeemaster.save
        format.html { redirect_to(@payroll_employeemaster, :notice => 'PayrollEmployeemaster was successfully created.') }
        format.xml  { render :xml => @payroll_employeemaster, :status => :created, :location => @payroll_employeemaster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payroll_employeemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payroll_employeemasters/1
  # PUT /payroll_employeemasters/1.xml
  def update
    @payroll_employeemaster = PayrollEmployeemaster.find(params[:id])

    respond_to do |format|
      if @payroll_employeemaster.update_attributes(params[:payroll_employeemaster])
        format.html { redirect_to(@payroll_employeemaster, :notice => 'PayrollEmployeemaster was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payroll_employeemaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payroll_employeemasters/1
  # DELETE /payroll_employeemasters/1.xml
  def destroy
    @payroll_employeemaster = PayrollEmployeemaster.find(params[:id])
    @payroll_employeemaster.destroy

    respond_to do |format|
      format.html { redirect_to(payroll_employeemasters_url) }
      format.xml  { head :ok }
    end
  end
end
