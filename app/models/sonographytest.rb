class Sonographytest < ActiveRecord::Base
	def patient_data(reg)
		@patientinfo=Patientappointmentinfo.find_by_registrationid(reg)
		@patient=Patientregistration.find_by_id(@patientinfo.patientregistration_id)
		@infor=Patientinformation.find_by_patientregistration_id(@patient.id)
		@op=Opbilling1.find_by_mrno(@patient.mrno)
		return @patient.mrno,@op.billno,@infor.firstname
	end
end
