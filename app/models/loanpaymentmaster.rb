class Loanpaymentmaster < ActiveRecord::Base
     validates_presence_of  :loan_amount, :receipt_amount_payment
end
