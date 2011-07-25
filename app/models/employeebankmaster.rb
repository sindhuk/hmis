class Employeebankmaster < ActiveRecord::Base
     validates_presence_of :bank_name, :bank_code, :branch, :city, :address, :contact_person, :contact_person_mobile_no, :account_type
		 validates_length_of :contact_person_mobile_no, :is => 10
	   
	   validates_numericality_of :contact_person_mobile_no, :only_integer => true


	end
