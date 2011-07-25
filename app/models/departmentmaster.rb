class Departmentmaster < ActiveRecord::Base
       belongs_to :doctormaster
	   has_many :employeemasters
	   validates_presence_of :name, :code, :status,
                             :hod, :contact_number_of_hod
							 
       validates_length_of :contact_number_of_hod, :is => 10
	   
	   validates_numericality_of :contact_number_of_hod, :only_integer => true
end
