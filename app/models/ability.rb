class Ability
  include CanCan::Ability

  def initialize(user)
    #user ||= User.new

    if user.nil? #when user not logged into application
        can :read, [Stock, BloodBank]
        
    
    elsif user.role? "admin"
        can :manage, :all

    
    elsif  user.role? "bloodbank"
        can [:read], BloodBank
        #can [:update], BloodBank do |bloodbank|
         #   bloodbank.try(:user) == user
        #end
            can [:create, :destroy], Stock do |stock|
                 stock.try(:user) == user
              end

        can [:create, :read], Stock
    
    
    
              
    elsif user.role? "user"
        can :read, Stock
        can :read, BloodBank
        can [:create,:update], User
                can [:read,:destroy] ,User do |person|
            person.try(:user) == user
        end

    end
    

        


  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
 end 
end
