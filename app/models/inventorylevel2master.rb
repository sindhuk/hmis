class Inventorylevel2master < ActiveRecord::Base
     validates_presence_of :item_level1_code, :item_level2_code, :item_level2_name, :status
end
