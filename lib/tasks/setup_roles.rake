task :setup_roles => :environment do 

	
	# Create Roles
	Role.create(name: "admin")
	Role.create(name: "bloodbank")
	
	Role.create(name: "requiredonar")
	Role.create(name: "user")
	

	# Create Users & Assign Roles
	user = User.create(email: "admin@gmail.com", password: "secret123")
	user.roles.push(Role.first) #assign admin role
	user.roles.push(Role.last)  #assign user role

    user = User.create(email: "bloodbank@gmail.com", password: "secret123")
    user.roles.push(Role.second)  #assign user role
	user.roles.push(Role.last)  #assign user role

	#user = User.create(email: "persondetail@gmail.com", password: "secret123")
    #user.roles.push(Role.third)  #assign user role
	#user.roles.push(Role.last)  #assign user role

	#user = User.create(email: "requiredonar@gmail.com", password: "secret123")
    #user.roles.push(Role.fourth)  #assign user role
	#user.roles.push(Role.last)  #assign user role

	user = User.create(email: "1@gmail.com", password: "secret123")
	user.roles.push(Role.last)
 
 end  