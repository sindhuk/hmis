class Contactinformation < ActiveRecord::Base
	validates_presence_of :address1, :phn_no, :zipcode
	validates_numericality_of :zipcode, :phn_no
	validates_length_of :zipcode, :is =>6
	
end
