class Duespagemaster < ActiveRecord::Base
	validates_presence_of :registration_no, :mr_no, :bill_no, :patient_name, :gross, :due, :concession, :refund
end
