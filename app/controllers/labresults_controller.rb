class LabresultsController < ApplicationController
  def index
	reg=params[:reg]
	@bo=0
	@tests=Array.new
	if(reg)
		
		
	end
  end
	def ajax_buildings
				mr=params[:q]
				@lr=Opbilling1.find_by_bill_no(mr)
				@pa=PatientregistrationData.find_by_mr_no(@lr.mr_no)
				@la=Testresult.find_by_opbilling1_id(@lr.id)
				render :text => @lr.mr_no+"/"+@lr.first_name+"/"+@pa.gender+"/"+@pa.age.to_s+"/"+@la.test_name
	end
end
