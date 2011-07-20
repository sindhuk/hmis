class RequestForTestEntry < ActiveRecord::Base
      has_many :requestfortestservice, :dependent => :destroy 
	 accepts_nested_attributes_for :requestfortestservice 
end
