class MedicinePage < ActiveRecord::Base
      has_many :medicine_list, :dependent => :destroy
	  accepts_nested_attributes_for :medicine_list 
end
