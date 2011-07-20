class Refferalmaster < ActiveRecord::Base
      validates_presence_of  :ref_doctor_name, :doctor_code, :consulting_room, :specialization, :designation, :address, :city, :state, :country, :phn_no, :pincode, :mail_id
end
