class Categorymaster < ActiveRecord::Base
	validates_presence_of :name, :code ,:status
end
