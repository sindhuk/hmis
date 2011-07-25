class Roommaster < ActiveRecord::Base
     belongs_to :wardmaster
	 has_many :bedmaster
	 #validates_presence_of  :room_entry, :block, :level, :phone_extension, :no_of_beds_in_room
end
