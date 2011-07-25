class Stockpointmaster < ActiveRecord::Base
         has_many :departmentmasters
		 validates_presence_of  :department_code, :department_name, :stock_point_name, :stock_point_type, :status
end
