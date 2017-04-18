class StocksController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    load_and_authorize_resource #invoke ability.rb


	#before_action :authenticate_user!, except: [:index, :show]
    #load_and_authorize_resource #invoke ability.rb
 
    #after_create :present_stock


    def index
    	@stocks = Stock.all
    	#@stock = current_user.stocks
    end

    def new
    	@stock = Stock.new

    end

    def create
    	@stock = Stock.new(stock_params)
        
        
       #@stock = present_stock(@stock.units)
    	@stock.user_id = current_user.id
        if @stock.save
            redirect_to stocks_path, notice: "Successfully Created"
        else
            render action: "new"
        end
    end

=begin
        exists = Stock.where('blood_bank_id = ? AND blood_group_id = ?', @stock.blood_bank_id, @stock.blood_group_id)
        if exists
             stock = Stock.where('blood_bank_id = ?', @stock.blood_bank_id).first
            stock.units += @stock.units
            if stock.update_attributes(stock_params)
                redirect_to stocks_path, notice:"Successfully Updated"
            else
                render action: "edit"
            end
    	elsif @stock.save
    		redirect_to stocks_path, notice: "successfully created"
    	  else
    		render action: "new"
    	end
    end
=end

    def show
    	begin
    	@stock = Stock.find(params[:id])
    	@stock = current_user.stocks.find(params[:id])
        rescue ActiveRecord::RecordNotFound
         redirect_to stocks_path, notice: "Record Not Found"
        end
    end

    def edit
    	@stock = Stock.find(params[:id])
    end

    def update
    	@stock = Stock.find(params[:id])
    	if @stock.update_attributes(stock_params)
    		redirect_to stocks_path, notice:"Successfully Updated"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@stock = Stock.find(params[:id])
    	@stock.destroy
    	redirect_to stocks_path, notice: "Successfully deleted"
    end
=begin

    def update_blood_availabilities
        BloodAvailability.delete_all
        BloodBank.all.each do |blood_bank|
            BloodGroup.all.each do |bloodgroup|
                ComponentType.all.each do |component|
                  blood_availability = BloodAvailability.new
                  blood_availability.blood_bank_id = blood_bank.id
                  blood_availability.blood_group_id = bloodgroup.id
                  blood_availability.component_type_id = component.id
                  blood_availability.total_stocks = 0
                  blood_availability.save
                end
            end
        end
        Stock.all.each do |stock|
          blood = stock.blood_bank.blood_availabilities.where('blood_group_id = ? AND component_type_id = ?', stock.blood_group_id, stock.component_type_id ).first
          new_stock = blood.total_stocks.to_i + stock.units.to_i
          blood.update_attributes(total_stocks: new_stock)
          blood.save
        end
        redirect_to stocks_path
    end
=end
    private 

    def stock_params
    	params[:stock].permit(:blood_bank_id, :blood_group_id, :component_type_id, :units)

    end

end