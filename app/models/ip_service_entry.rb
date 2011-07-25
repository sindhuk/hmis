class IpServiceEntry < ActiveRecord::Base
      has_many :ip_service
	  accepts_nested_attributes_for :ip_service
	  validates_presence_of :mr_no, :reg_no, :service_no, :patient_name, :doctor, :company,
	                  :free, :grossamount, :concession, :netamount      
end
