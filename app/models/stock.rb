class Stock < ActiveRecord::Base
	belongs_to :blood_bank
	belongs_to :user
	belongs_to :blood_group
  belongs_to :component_type


after_create :present_stock


  def present_stock
  	#total_stocks = 0
  	#total_stocks = total_stocks+self.units
    blood_availability = self.blood_bank.blood_availabilities.where('blood_group_id = ? AND component_type_id = ?', self.blood_group_id, self.component_type_id).first
    #blood_availability = self.blood_bank.blood_availabilities.find_by_blood_group_id(self.blood_group_id)
    new_stock = blood_availability.total_stocks.to_i + self.units.to_i
  
    blood_availability.update_attributes(total_stocks: new_stock)
    blood_availability.save
  end



after_destroy :update_stock 
      

      def update_stock
      blood_availability = self.blood_bank.blood_availabilities.where('blood_group_id = ? AND component_type_id = ?', self.blood_group_id, self.component_type_id).first
    #blood_availability = self.blood_bank.blood_availabilities.find_by_blood_group_id(self.blood_group_id)
    new_stock = blood_availability.total_stocks.to_i - self.units.to_i
  
    blood_availability.update_attributes(total_stocks: new_stock)
    blood_availability.save
  end

  
end



  

    