class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user != current_user
        can :read, :all
    else
        can :manage, :all
    end
    
  end
end
