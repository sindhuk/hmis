class Number < ActiveRecord::Base
	def retrive_value(type)
		@value=Number.find_by_names(type)
		@Update_value=@value.value+1
		@value.value=@Update_value
		return @Update_value
	end
	
end
