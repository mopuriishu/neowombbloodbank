class BloodBank < ActiveRecord::Base
 
   #mount_uploader :cover, CoverUploader

	

  has_many :stocks
	has_many :blood_availabilities
	belongs_to :locality
	belongs_to :district
	belongs_to :state
  belongs_to :user
	
	
  validates_presence_of :name


  after_create :present_availability

 
    def present_availability
           BloodGroup.all.each do |bloodgroup|
            ComponentType.all.each do |component|
              blood_availability = BloodAvailability.new
              blood_availability.blood_bank_id = self.id
              blood_availability.blood_group_id = bloodgroup.id
              blood_availability.component_type_id = component.id
              blood_availability.total_stocks = 0
              blood_availability.save
            end
          end
        end
end