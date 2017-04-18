class State < ActiveRecord::Base
	has_many :districts
	has_many :localities

	has_many :blood_banks
	has_many :hospitals
	

   #validates_presence_of :name

end
