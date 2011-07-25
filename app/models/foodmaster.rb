class Foodmaster < ActiveRecord::Base
     validates_presence_of :item_name, :item_code, :charge
end
