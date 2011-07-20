class Wardmaster < ActiveRecord::Base
       belongs_to :floormaster
	   has_many :roommasters
	   def to_s
	   "#{wardname}"
	  end 
	  
end
