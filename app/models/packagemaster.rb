class Packagemaster < ActiveRecord::Base
       validates_presence_of  :name, :code, :no_of_days, :from_date, :to_date, :service
end
