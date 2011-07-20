class Goodissuenotemaster < ActiveRecord::Base

      validates_presence_of :from_stock_point_name, :from_stock_point_code, :to_stock_point_code, :to_stock_point_name, :issuing_date, :item_code, :item_name, :batch_no, :item_expity_date, :quantity, :purchase_rate, :purchase_amount, :sale_rate, :sale_amount

end
