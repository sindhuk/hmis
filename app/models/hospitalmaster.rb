class Hospitalmaster < ActiveRecord::Base
       belongs_to :citymaster
	   belongs_to :statemaster
	   belongs_to :countrymaster
	   validates_presence_of :name, :code, :address, :city, :state, :country, :tan_no, :logo, :vat_no
end
