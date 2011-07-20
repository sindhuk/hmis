class PayrollEmployeemaster < ActiveRecord::Base
    validates_presence_of  :employee_name, :category_name, :category_code, :depattment_name, :department_code, :designation_code, :employee_code, :employee_date_of_birth, :employee_joining_date, :repersting_manager_for_the_employee, :employeement_type, :start_date, :end_date, :salary_type, :bank_code, :gross, :basic, :da, :hra, :conveyeney, :education, :medical, :proffessional_tax, :eligible_for_provident_found, :provident_found, :employee_pf, :esi, :tds, :hostel, :volantry_pf
end
