class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :read, User 
    return unless user.present?
    can :manage, User, id: user.id

  end
end
