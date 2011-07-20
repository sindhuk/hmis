class Loandeductionmaster < ActiveRecord::Base
      validates_presence_of  :month, :year, :branch, :category_code, :category_name, :employee_code, :employee_name, :loan_entry_type_code, :loan_entry_type_name, :installment_amount, :deduction_amount, :loan_balance_amount, :remarks
end
