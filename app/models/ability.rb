class Ability
  include CanCan::Ability

  def initialize(userOrAdmin)

  	if userOrAdmin.user?
	    can :read, User 
	    return unless user.present?
	    can :manage, User, id: user.id
	  elsif userOrAdmin.admin? 
	  	can [:update, :read] , Admin, id: admin.id
	  end
  end
end



