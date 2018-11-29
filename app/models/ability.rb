class Ability
  include CanCan::Ability

  def initialize(user)

  	if user.player? #so that mean he is a player not admin
	    can :read, User 
	    return unless user.present?
	    can :manage, User, id: user.id
	  elsif user.admin? #means he is an admin as stated at admin.rb
	  	can [:update, :show] , Admin, id: admin.id
	  end
  end
end



