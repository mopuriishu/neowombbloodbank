class User < ActiveRecord::Base
	has_many :blood_banks
	has_many :hospitals
	has_many :stocks
	has_many :person_details
	
	belongs_to :blood_group

	has_many :permissions
    has_many :roles, through: :permissions
 
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :generate_role
  
         def role?(role)
  	      self.roles.pluck(:name).include? role
         end

        def generate_role
          Permission.create(user_id: self.id, role_id: Role.last.id)
        end

        

end
