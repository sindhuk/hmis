class Servicegroupmaster < ActiveRecord::Base
      belongs_to :servicemaster
	  validates_presence_of  :name, :code
end
