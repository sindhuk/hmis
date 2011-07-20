class Goodsrecieptnotemaster < ActiveRecord::Base

      validates_presence_of :grn_number, :grn_date, :po_number, :po_date, :vendor_code, :invoice_number, :invoioce_date, :stack_point_name, :item_code, :item_name, :batch_no, :quantity, :purchase_rate, :purchase_amount, :sale_rate, :sale_amount 
	  end
