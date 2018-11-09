class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :read, User 
    return unless user.present?
    can :manage, User, user_id: user.id
    
  end
end
