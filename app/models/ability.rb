class Ability
  include CanCan::Ability

  def initialize(user)
  	if user.is_a?(User)
	    can :read, User 
	    return unless user.present?
	    can :manage, User, id: user.id
	  elsif user.is_a?(Admin)
	  	can [:read, :update], Admin, id: admin.id
	  end
	  	
  end

 # def initialize(admin)
  #	can [:read, :update], Admin, id: admin.id
 # end

end



