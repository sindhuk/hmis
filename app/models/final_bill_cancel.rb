class FinalBillCancel < ActiveRecord::Base
     has_many :final_bill_cancel_service, :dependent => :destroy
	 accepts_nested_attributes_for :final_bill_cancel_service
end
