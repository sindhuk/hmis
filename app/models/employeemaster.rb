class Employeemaster < ActiveRecord::Base
        belongs_to :designationmaster
		belongs_to :departmentmaster
        belongs_to :citymaster
		belongs_to :statemaster
		belongs_to :countrymaster
		 validates_presence_of :name, :code, :designation, :department, :address, :mobile_no, :pincode, :email_id
		 validates_length_of :mobile_no, :is => 10
	   
	     validates_numericality_of :mobile_no, :only_integer => true

		 validates_format_of  :email_id, :with =>/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
		 validates_uniqueness_of :email_id
end
