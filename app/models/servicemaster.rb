class Servicemaster < ActiveRecord::Base
      	validates_presence_of  :name, :doctor_percentage, :hospital_percentage
end
