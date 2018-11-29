class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User 
    return unless user.present?
    can :manage, User, id: user.id
  end

  def initialize(admin)
  	can :read, Admin
  	return unless user.present?
  	can :manage, User, id: admin.id
  end

end
