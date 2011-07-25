class Doctormaster < ActiveRecord::Base
	has_many :designationmasters
	has_many :citymasters
	has_many :countrymasters
	has_many :statemasters
	has_many :departmentmasters
	has_many :consultationcharges
	validates_presence_of :name, :code, :designation, :department, :address, :fee, :city, :state, :country, :pincode, :mobile_no, :consulting_room
	def to_s
		"#{designationcode}"
		end
	 def to_s
		"#{doctordepartment}"	 
	 end
end
