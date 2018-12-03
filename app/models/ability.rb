class Ability
  include CanCan::Ability

  def initialize(userOrAdmin)

  	if userOrAdmin.is_a? User
	    can :read, User 
	    return unless user.present?
	    can :manage, User, id: user.id
	  elsif userOrAdmin.is_a?  Admin
	  	can [:update, :read] , Admin, id: admin.id
	  end
  end
end



