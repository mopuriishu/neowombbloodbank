class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.blood_required.subject
  #
 # def blood_required(persondetail)
    #@person_details = persondetail
    
    #@persondetails = persondetail

def blood_required(donars, data)
  
  @donars = donars
  @data = data
  
    #mail to: "{@person_details.email}"
  mail to: "#{@donars.pluck(:email).join(',')}"
  #@donars.each do |donar|
   #  mail to: "#{donar.email}"
  #end
end
  
    #mail to: "#{announcement.user.clients.pluck(:email).join(',')}", subject: "#{announcement.title}"

  end

