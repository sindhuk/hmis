class Doctorsheduling < ActiveRecord::Base
validates_presence_of :department_name, :doctor_id, :doctor_name, :date
end
