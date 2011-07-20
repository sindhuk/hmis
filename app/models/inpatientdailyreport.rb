class Inpatientdailyreport < ActiveRecord::Base
     GENDERS = ['male','female']
	 validates_presence_of :registrationid, :date, :admissionid, :dateofappointment, :firstname, :lastname, :gender, :age, :doctorname,
	 :time, :watdtype, :wardno, :bedno, :prescription
end
