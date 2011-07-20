class Statemaster < ActiveRecord::Base
     belongs_to :countrymaster
	 belongs_to :doctormaser
	 has_many :citymasters
	 has_many :employeemasters
	 has_many :hospitalmaster
	 def to_s
	     "#{state}"
	 	    
	end
	validates_presence_of  :country_name, :name
end
