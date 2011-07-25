class Leavemaster < ActiveRecord::Base
      validates_presence_of :leave_type_code, :leave_type_name, :status
end
