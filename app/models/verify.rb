class Verify < ActiveRecord::Base
	   $profile_name
	   $user_name
	  def store(name)
		$user_name=name
		people=Person.find_by_name(name)
		$profile_name=people.profile
		$user_name=people.Displayname
	  end
	  def retrive(table1)
	    @p=Profilemaster.find_by_profile_name($profile_name)
		@ch=Childmaster.find(:all, :conditions => "profilemaster_id ='#{@p.id}'")
		for i in 0...@ch.length
         if (@ch[i].forms==table1)
			return @ch[i].new<<@ch[i].view<<@ch[i].edit<<@ch[i].remove
		 end
		end
	end
	def retrive_id
		@p=Profilemaster.find_by_profile_name($profile_name)
		return @p.id
	end
	def profile_value
		return $profile_name
	end
	def name
		
		return $user_name
	end
end
