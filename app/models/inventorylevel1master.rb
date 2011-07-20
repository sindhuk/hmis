class Inventorylevel1master < ActiveRecord::Base
    validates_presence_of :item_level1, :item_level1_name, :status
end
