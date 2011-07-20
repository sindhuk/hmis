class Consultationform < ActiveRecord::Base
	
	acts_as_reportable
	$key_data
	
	def incre(mr)
		@pa=Patientregistration.find_by_mrno(mr)
		@infor=Patientinformation.find_by_patientregistration_id(@pa.id)
		@con = Contactinformation.find_by_patientregistration_id(@pa.id)
		@painfo=Patientappointmentinfo.find_by_patientregistration_id(@pa.id)
		
		return @infor.firstname,@infor.lastname,@infor.fathername,@infor.gender,@infor.age,@con.address1
	end
	
	def store_key(key_value)
		$key_data=key_value
	end
	def return_key
		return $key_data
	end
end
