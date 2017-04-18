class PersonDetailsController < ApplicationController

	#before_action :authenticate_user!, except: [:index, :show]
    #load_and_authorize_resource #invoke ability.rb


	before_action :authenticate_user!, except: [:index, :show]
    # load_and_authorize_resource #invoke ability.rb

def index
	@persondetails = PersonDetail.where('user_id=?',current_user.id)
	#@persondetail = current_user.person_details

end

def new
	@persondetail = PersonDetail.new

end

def create
	@persondetail = PersonDetail.new(persondetails_params)
	@persondetail.user_id = current_user.id
	
	if @persondetail.save
		#Notification.blood_required(@persondetail).deliver
		redirect_to person_details_path, notice: "Your details are added"
	else
		render action: "new"
	end
end

def show
	begin
		@persondetail = PersonDetail.find(params[:id])
		#@persondetail= current_user.person_details.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to person_details_path, notice: "Record Not Found"
	end
end

def edit
	@persondetail = PersonDetail.find(params[:id])
end

def update
	@persondetail = PersonDetail.find(params[:id])
	if @persondetail.update_attributes(persondetails_params)
		redirect_to person_details_path,notice: "Sucessfully Updated"
	else
		render action: "edit"
	end
end

def destroy
	@persondetail = PersonDetail.find(params[:id])
	@persondetail.destroy
	redirect_to person_details_path, notice: "Sucessfully Destroyed"
end


private
	def persondetails_params
		params[:person_detail].permit(:name, :email, :mobile_no, :state_id, :district_id, :locality_id, :blood_group_id)
    end

    
end
