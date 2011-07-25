class Opbillservice < ActiveRecord::Base
validates_presence_of :service_consultaion_no, :service_cancel_date, :bill_no, :bill_date, :service_name, :service_code, :amount 
end
