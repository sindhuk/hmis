class ApproximateBill < ActiveRecord::Base
     has_many :approximate_service, :dependent => :destroy 
	 accepts_nested_attributes_for :approximate_service
end
