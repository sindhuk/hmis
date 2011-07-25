class Itemmaster < ActiveRecord::Base
     validates_presence_of :item_level1_code,  :item_level2_code, :item_level3_code, :item_code, :item_name
	 
end
	 