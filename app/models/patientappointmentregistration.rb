class Patientappointmentregistration < ActiveRecord::Base
        GENDERS = ['male','female']
		PATIENTTYPES = ['new','old']
		MARITALSTATUSES =['single','married']
		def find_values(mrn)
			
			document.getElementById('name').value
			patient=Patientappointmentregistration.find_by_mrno(mrn)
			ar=Array[patient.mrno,",",patient.firstname,",",patient.lastname]
			return ar
		end
		
end
