class Patientinformation < ActiveRecord::Base
	belongs_to :patientregistration 
	validates_presence_of :first_name, :last_name, :age, :marital_status, :father_name, :initial_amount, :disease
	validates_numericality_of :age, :initial_amount
end
