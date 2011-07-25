class Vendormaster < ActiveRecord::Base
     validates_presence_of  :vendor_code, :vendor_name, :vendor_tin_no, :vat_no, :address, :list_of_items_supplied, :contact_person, :vendor_emailid, :contact_num, :status
end
