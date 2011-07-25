class Opbilling1 < ActiveRecord::Base
 has_many :testresult
 accepts_nested_attributes_for :testresult, :allow_destroy => true
 
 def data
	@doctor=Doctormaster.all
	str=""
	i=0
	for i in 0...@doctor.length
		str<<@doctor[i].department+","+@doctor[i].name+","
	end
	
	return str
 end
end
