class Designationmaster < ActiveRecord::Base
	belongs_to :doctormaster
	has_many :employeemasters
	
	 validates_presence_of :name, :code, :department_name, :department_code, :status
end
