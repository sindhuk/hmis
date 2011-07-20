class Ipadmission < ActiveRecord::Base
	validates_presence_of :admission_no, :admission_date,:mr_no, :patient_name, :reg_no, :father_name, :department, :floor, :ward, :room, :bed, :status, :attender_name, :mobile_no, :address 
	acts_as_reportable
	$key_data
	def store_key(key_value)
		$key_data=key_value
	end
	def return_key
		return $key_data
	end
	
	def data_save(mr_no,doctor)
		puts mr_no
		@ipadmission = Ipadmission.last(:conditions => "mr_no = '#{mr_no}'")
		@ipadmission1=Ipadmission.new
		puts @ipadmission.id
		@ipadmission1.admission_date=@ipadmission.admission_date
		puts @ipadmission1.admission_date
		@ipadmission1.time=@ipadmission.time
		@ipadmission1.admission_type=@ipadmission.admission_type
		@ipadmission1.accident_place=@ipadmission.accident_place
		@ipadmission1.accident_type=@ipadmission.accident_type
		@ipadmission1.authorised_police_station=@ipadmission.authorised_police_station
		@ipadmission1.time_of_accident=@ipadmission.time_of_accident
		@ipadmission1.mr_no=@ipadmission.mr_no
		@ipadmission1.patient_name=@ipadmission.patient_name
		@ipadmission1.reg_no=@ipadmission.reg_no
		@ipadmission1.father_name=@ipadmission.father_name
		@ipadmission1.ip_department=@ipadmission.ip_department
		@ipadmission1.department=@ipadmission.department
		@ipadmission1.doctor=doctor
		@ipadmission1.type=@ipadmission.type
		@ipadmission1.floor=@ipadmission.floor
		@ipadmission1.ward=@ipadmission.ward
		@ipadmission1.room=@ipadmission.room
		@ipadmission1.bed=@ipadmission.bed
		@ipadmission1.status=@ipadmission.status
		@ipadmission1.attender_name=@ipadmission.attender_name
		@ipadmission1.mobile_no=@ipadmission.mobile_no
		@ipadmission1.address=@ipadmission.address
		@ipadmission1.save
	end
end
