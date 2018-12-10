class Ability
  include CanCan::Ability

  def initialize(userOrAdmin)

  	if userOrAdmin.is_a? User
	    can :read, User 
	    can :manage, User, id: userOrAdmin.id
	  elsif userOrAdmin.is_a?  Admin
	  	can [:update, :read] , Admin, id: userOrAdmin.id
	  end
  end
end



