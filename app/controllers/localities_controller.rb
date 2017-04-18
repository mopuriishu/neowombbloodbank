class LocalitiesController < ApplicationController

    #before_action :authenticate_user!, except: [:index, :show]
    #load_and_authorize_resource #invoke ability.rb

	def index
		@localities = Locality.all
         


        
		#@bloodbank = current_user.blood_banks
	end


	def new
		@locality = Locality.new
	end

    def create
    	@locality = Locality.new(locality_params)        

    	if @locality.save
    		redirect_to localities_path, notice: "successfully created"
    	else
    		render action: "new"
        end
     end


    def show
    	begin
    	@locality = Locality.find(params[:id])
       
    rescue ActiveRecord::RecordNotFound
    	redirect_to localities_path,notice: "Record Not Found"
     end
 end

    def edit
    	@locality = Locality.find(params[:id])
    end

    def update

    	@locality = Locality.find(params[:id])
    	if @locality.update_attributes(locality_params)
    		redirect_to localities_path, notice: "successfully created"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@locality = Locality.find(params[:id])
    	@locality.destroy
    	redirect_to localities_path, notice: "successfully destroyed"

    end

    #def thirdpartyapi
       # @gender = gender.http()
    #end

    

    private

     def locality_params
     	params[:locality].permit(:name, :state_id, :district_id)

      end


end
