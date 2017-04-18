class StatesController < ApplicationController
    # before_action :authenticate_user!, except: [:index, :show]
    #load_and_authorize_resource #invoke ability.rb

	def index
		@states = State.all
         #@bloodbank = current_user.blood_banks
	end


	def new
		@state = State.new
	end

    def create
    	@state = State.new(state_params)        

    	if @state.save
    		redirect_to states_path, notice: "successfully created"
    	else
    		render action: "new"
        end
     end


    def show
    	begin
    	@state = State.find(params[:id])
       
    rescue ActiveRecord::RecordNotFound
    	redirect_to states_path,notice: "Record Not Found"
     end
 end

    def edit
    	@state = State.find(params[:id])
    end

    def update

    	@state = State.find(params[:id])
    	if @states.update_attributes(state_params)
    		redirect_to states_path, notice: "successfully created"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@state = State.find(params[:id])
    	@state.destroy
    	redirect_to states_path, notice: "successfully destroyed"

    end

    

    private

     def state_params
     	params[:state].permit(:name)

      end
end
