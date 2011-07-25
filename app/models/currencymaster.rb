class Currencymaster < ActiveRecord::Base
     has_many :countrymasters
	def to_s
	   "#{currency}"
	 end  
     validates_presence_of :name, :code
end
