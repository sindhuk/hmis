class Countrymaster < ActiveRecord::Base
      belongs_to :currencymaster
	  belongs_to :doctormaser
	  validates_presence_of :name
	  has_many :statemasters
	  has_many :bankmasters
	  has_many :employeemasters
	  has_many :hospitalmaster
	  
	  def to_s
	      "#{country}"
		end
end
