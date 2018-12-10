class Ability
  include CanCan::Ability

  def initialize(userOrAdmin)

  	if userOrAdmin.is_a? User
  		  can :read, User 
  		if userOrAdmin.present?
		    can :update, User, id: userOrAdmin.id
		  end
	  elsif userOrAdmin.is_a?  Admin
	  	can [:update, :read] , Admin, id: userOrAdmin.id
	  end
  end
end



