class AppointmentSheduling < ActiveRecord::Base

	validates_presence_of :appointment_no, :appointment_date, :time, :doctor_name

end
