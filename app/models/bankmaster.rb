class Bankmaster < ActiveRecord::Base
      belongs_to :citymasters
	  belongs_to :statemaster
	  belongs_to :countrymaster
	  
	 validates_presence_of :name, :code, :branch , :address, :city, :state, :country, :phno
	
	    validates_format_of  :mail, :with =>/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
		validates_uniqueness_of :mail
end
