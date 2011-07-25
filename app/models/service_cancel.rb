class ServiceCancel < ActiveRecord::Base
     has_many :service_cancel_service
	 accepts_nested_attributes_for :service_cancel_service
end
