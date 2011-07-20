class Citymaster < ActiveRecord::Base
     belongs_to :state
	 validates_presence_of :state_name, :state_id, :name
end
