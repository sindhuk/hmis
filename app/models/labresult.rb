class Labresult 
	attr_reader :billno
	attr_writer :billno

	def initialize(data)
		@billno = data
	end
	def lab_data(reg)
		@op=Opbilling1.find_by_bill_no(reg)
		@patient=PatientregistrationData.find_by_mr_no(@op.mr_no)
		
		
		@test1=Testresult.all
		@ar=Array.new
		j=0
		for i in 0...@test1.length
			if @op.id==@test1[i].opbilling1_id
				@ar[j]=@test1[i].test_name
				j+=1
			end
		end
		
		return @patient.mr_no,@patient.first_name,@patient.age,@patient.gender,@ar
	end
end
