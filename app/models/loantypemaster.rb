class Loantypemaster < ActiveRecord::Base
       validates_presence_of  :loantypecode, :loantypedescription, :interestrate, :interestpercentage, :maximumamount, :numberofinstallments
end
