class Profilemaster < ActiveRecord::Base
       has_many :childmaster, :dependent => :destroy  
       accepts_nested_attributes_for :childmaster
	   has_many :citymaster
end
