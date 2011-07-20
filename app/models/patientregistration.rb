class Patientregistration < ActiveRecord::Base
	acts_as_reportable
	GENDERS = ['male','female']
	PATIENTTYPES = ['new','old']
	MARITALSTATUSES =['single','married']
	
	has_many :patientinformation, :dependent => :destroy  
	has_many :patientappointmentinfo, :dependent => :destroy
	has_many :contactinformation, :dependent => :destroy
	has_many :insurenceinformation, :dependent => :destroy
	
    accepts_nested_attributes_for :patientinformation, :patientappointmentinfo, :contactinformation, :insurenceinformation
	
	
	
	end
