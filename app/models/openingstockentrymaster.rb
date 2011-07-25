class Openingstockentrymaster < ActiveRecord::Base
   validates_presence_of  :item_code, :item_name, :batch_number, :expiry_date, :quantity, :purchase_date, :purchase_amount, :sale_rate, :sale_amount, :discount_amount
end
