class FinalBill < ActiveRecord::Base
     has_many :final_service, :dependent => :destroy
	 accepts_nested_attributes_for :final_service
end
