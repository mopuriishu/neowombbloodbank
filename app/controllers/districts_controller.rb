class DistrictsController < ApplicationController
    #before_action :authenticate_user!, except: [:index, :show]
    #load_and_authorize_resource #invoke ability.rb

	def index
		@districts = District.all
         


        
		#@bloodbank = current_user.blood_banks
	end


	def new
		@district = District.new
	end

    def create
    	@district = District.new(district_params)        

    	if @district.save
    		redirect_to districts_path, notice: "successfully created"
    	else
    		render action: "new"
        end
     end


    def show
    	begin
    	@district = District.find(params[:id])
       # @bloodbank = current_user.blood_banks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    	redirect_to districts_path,notice: "Record Not Found"
     end
 end

    def edit
    	@district = District.find(params[:id])
    end

    def update

    	@district = District.find(params[:id])
    	if @district.update_attributes(district_params)
    		redirect_to districts_path, notice: "successfully created"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@district = District.find(params[:id])
    	@district.destroy
    	redirect_to districts_path, notice: "successfully destroyed"

    end

    

    private

     def district_params
     	params[:district].permit(:name, :state_id)

      end
end
