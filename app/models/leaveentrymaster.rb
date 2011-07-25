class Leaveentrymaster < ActiveRecord::Base
    validates_presence_of :from_date, :to_date 
	
end
