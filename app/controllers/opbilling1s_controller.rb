class Opbilling1sController < ApplicationController
  # GET /opbilling1s
  # GET /opbilling1s.xml
  def index
    @opbilling1s = Opbilling1.all
	@v= Verify.new
	@value=@v.retrive("OP Billing")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opbilling1s }
    end
  end

  # GET /opbilling1s/1
  # GET /opbilling1s/1.xml
  def show
    @opbilling1 = Opbilling1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opbilling1 }
    end
  end

  # GET /opbilling1s/new
  # GET /opbilling1s/new.xml
  def new
    @opbilling1 = Opbilling1.new
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opbilling1 }
    end
  end

  # GET /opbilling1s/1/edit
  def edit
    @opbilling1 = Opbilling1.find(params[:id])
  end

  # POST /opbilling1s
  # POST /opbilling1s.xml
  def create
    @opbilling1 = Opbilling1.new(params[:opbilling1])
	@data=params[:tblSample]
	@da=params[:sno].to_i
	@opbilling=Opbilling1.last
	if(@opbilling)
		@id=@opbilling.id+1
	else
		@id=1
	end
	for i in 1..@da
		@testresult=Testresult.new
		@row="r#{i}"
		@testresult.opbilling1_id=@id
		@testresult.s_no=@i
		for j in 1..4 
			@col="c#{j}"
			@row_data=@row+@col
			puts @row_data
			puts params[@row_data]
			if(j==1)
				@testresult.test_name=params[@row_data]
			elsif(j==2)
				@testresult.fee=params[@row_data]
			elsif(j==3)
				@testresult.concessin=params[@row_data]
			elsif(j==4)
				@testresult.total_fee=params[@row_data]
			end
		end
		@testresult.save
	end
	respond_to do |format|
      if @opbilling1.save
		@n=Number.find_by_names("bill")
		@n.value=@opbilling1.bill_no
		@n.update_attributes(params[:n])
		@n=Number.find_by_names("reciept")
		@n.value=@opbilling1.receipt_no
		@n.update_attributes(params[:n])
        format.html { redirect_to(@opbilling1, :notice => 'Opbilling1 was successfully created.') }
        format.xml  { render :xml => @opbilling1, :status => :created, :location => @opbilling1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opbilling1.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /opbilling1s/1
  # PUT /opbilling1s/1.xml
  def update
    @opbilling1 = Opbilling1.find(params[:id])

    respond_to do |format|
      if @opbilling1.update_attributes(params[:opbilling1])
        format.html { redirect_to(@opbilling1, :notice => 'Opbilling1 was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opbilling1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opbilling1s/1
  # DELETE /opbilling1s/1.xml
  def destroy
    @opbilling1 = Opbilling1.find(params[:id])
    @opbilling1.destroy

    respond_to do |format|
      format.html { redirect_to(opbilling1s_url) }
      format.xml  { head :ok }
    end
  end
  def ajax_buildings
	mr=params[:q]
	type1=params[:type]
		 	str=""
		 if(type1=="dept")
				@dop=Doctormaster.find(:all, :conditions => "department = '#{mr}'")
				puts @dop.length
				for i in 0...@dop.length
				str<<@dop[i].name+","
				end
				render :text =>str
		elsif(type1=="c_no")
				@cn=Consultationform.find_by_consultation_no(mr)
				@patient=PatientregistrationData.find_by_mr_no(@cn.mr_no)
				@n=Number.new
				@Update_bill_value=@n.retrive_value("bill")
				@Update_reciept_value=@n.retrive_value("reciept")
				@value=0+@cn.id
				@value1="RG000000"
				@value1<<@value.to_s
				render :text => @Update_bill_value.to_s+","+@cn.date_of_consultation+","+@cn.mr_no+","+@value1+","+@cn.first_name+","+@patient.occupation+","+@Update_reciept_value.to_s

		elsif(type1=="service")
			@test = Testmaster.find_by_test_name(mr)
			render :text => @test.fee.to_s
		end
  end
  
   def mrno
		if(params[:type]=="mr")
			query=["mr_no Like ?",params[:q]+"%"]
		elsif(params[:type]=="reg")
			query=["reg_no Like ?",params[:q]+"%"]
		elsif(params[:type]=="mobile")
			query=["mobile_no Like ?",params[:q]+"%"]
		elsif(params[:type]=="Pname")
			query=["first_name Like ?",params[:q]+"%"]
		elsif(params[:type]=="Pname_Father")
			split_value=params[:q].split(',')
			query=["first_name like ? and father_name like ?",split_value[0]+"%",split_value[1]+"%"]
		elsif(params[:type]=="father")
			query=["father_name Like ?",params[:q]+"%"]
		elsif(params[:type]=="Father_Pname")
			split_value=params[:q].split(',')
			query=["first_name like ? and father_name like ?",split_value[0]+"%",split_value[1]+"%"]
		elsif(params[:type]=="city")
			query=["city = ?",params[:q]]
		elsif(params[:type]=="City_Pname")
			split_value=params[:q].split(',')
			query=["city = ? and first_name like ?",split_value[0],split_value[1]+"%"]
		elsif(params[:type]=="City_Father")
			split_value=params[:q].split(',')
			query=["city = ? and father_name like ?",split_value[0],split_value[1]+"%"]
		elsif(params[:type]=="City_Both")
			split_value=params[:q].split(',')
			query=["city = ? and first_name like ? and father_name like ?",split_value[0],split_value[1]+"%",split_value[2]+"%"]
		elsif(params[:type]=="gender")
			query=["gender = ?",params[:q]]
		end
		puts "outside"
		@patientinformation=Consultationform.find(:all, :conditions => query)
		if(@patientinformation)
			puts "enter"
			render :partial => "mrseach"
		else
			render :text => "Not Match"
		end

  end
  def bed_select
  end
end
