
class BloodBanksController < ApplicationController
	 
	 
      before_action :authenticate_user!, except: [:index, :show]
      load_and_authorize_resource #invoke ability.rb
 


	def index
		@bloodbanks = BloodBank.all
  end


	def new
		@bloodbank = BloodBank.new
	end

    def create
    	@bloodbank = BloodBank.new(bloodbank_params)        

    	if @bloodbank.save
    		redirect_to blood_banks_path, notice: "successfully created"
    	else
    		render action: "new"
        end
     end


    def show
    	begin
    	@bloodbank = BloodBank.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    	redirect_to blood_banks_path,notice: "Record Not Found"
     end
 end

    def edit
    	@bloodbank = BloodBank.find(params[:id])
    end

    def update

    	@bloodbank = BloodBank.find(params[:id])
    	if @bloodbank.update_attributes(bloodbank_params)
    		redirect_to blood_banks_path, notice: "successfully created"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@bloodbank = BloodBank.find(params[:id])
    	@bloodbank.destroy
    	redirect_to blood_banks_path, notice: "successfully destroyed"

    end

    

    private

     def bloodbank_params
     	params[:blood_bank].permit(:name, :address, :locality_id, :district_id, :state_id, :email, :mobile, :landline_number,:manager ,:cover)

      end
 end
