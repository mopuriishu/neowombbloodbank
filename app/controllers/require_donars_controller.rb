class RequireDonarsController < ApplicationController
 
 
    
    def results
    	#persondetail = PersonDetail.find(params[:person_detail_id]
      data_hash = {}
      data_hash["blood_group_id"] = params[:blood_group_id]
      data_hash["state_id"] = params[:state_id]
      data_hash["district_id"] = params[:district_id]
      data_hash["locality_id"] = params[:locality_id]

      @blood_group= params[:blood_group_id] 
      @state_id =  params[:state_id] 
      @district_id =  params[:district_id] 
      @locality_id =  params[:locality_id]
     # @donars = PersonDetail.where( 'blood_group_id=?', @blood_group)

      @donars = PersonDetail.where('blood_group_id=? AND state_id=? AND  district_id=? AND locality_id=? ', @blood_group, @state_id,@district_id ,@locality_id)
      donars = @donars
      
      #Notification.blood_required( @person_details).deliver_now
      Notification.blood_required(donars, data_hash).deliver


      #binding.pry
       #Notification.blood_required( persondetail).deliver
     end
  end

  



#def send_the_email
 #  donars = RequireDonars.find(params[:donar_id])
   
  # Notification.blood_required(donars).deliver
   #redirect_to :back, notice: "successfully completed task"

#end




