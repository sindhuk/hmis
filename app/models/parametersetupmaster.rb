class Parametersetupmaster < ActiveRecord::Base
     validates_presence_of  :service, :parameter1, :minimum, :maximum, :parameter2, :min, :max, :units
end
