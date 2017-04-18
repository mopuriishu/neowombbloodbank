class BloodAvailabilitiesController < ApplicationController
 
 #before_action :authenticate_user!, except: [:index, :show]
  # load_and_authorize_resource #invoke ability.rb
 
    


    def index
    	@bloodavailabilities = BloodAvailability.all
    	#@stock = current_user.stocks
    end

    def new
    	@bloodavailability = BloodAvailability.new

    end

    def create
    	@bloodavailability = BloodAvailability.new(bloodavailability_params)
        
        #@stock.blood_availability = present_stock(@stock.units)
    	@bloodavailability.user_id = current_user.id
        if @bloodavailability.save
            redirect_to blood_availabilities_path, notice: "Successfully Created"
        else
            render action: "new"
        end
    end

    

    def show
    	begin
    	@bloodavailability = BloodAvailability.find(params[:id])
    	#@bloodavailability = current_user.blood_availabilites.find(params[:id])
        rescue ActiveRecord::RecordNotFound
         redirect_to blood_availabilities_path, notice: "Record Not Found"
        end
    end

    def edit
    	@bloodavailability = BloodAvailability.find(params[:id])
    end

    def update
    	@bloodavailability= BloodAvailability.find(params[:id])
    	if @bloodavailability.update_attributes(bloodavailability_params)
    		redirect_to blood_availabilities_path, notice:"Successfully Updated"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@bloodavailability = BloodAvailability.find(params[:id])
    	@bloodavailability.destroy
    	redirect_to blood_availabilities_path, notice: "Successfully deleted"
    end

    private 

    def bloodavailability_paramss_params
    	params[:blood_availability].permit(:blood_bank_id, :blood_group_id, :component_type_id, :total_stocks)

    end

end


