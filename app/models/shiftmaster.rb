class Shiftmaster < ActiveRecord::Base
      validates_presence_of  :name, :code, :form_time, :to_time, :description
end
