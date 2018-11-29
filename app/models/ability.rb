class Ability
  include CanCan::Ability

  def initialize(user_or_admin)
    user_or_admin ||= User.new
    if user_or_admin.kind_of? Admin
      admin_rules(user_or_admin)
    else
      user_rules(user_or_admin)
    end
  end
 
  def admin_rules(admin)
    can [:read, :update], Admin, id: admin.id
  end

  def user_rules(user)
    can :read, User 
    return unless user.present?
    can :manage, User, id: user.id
  end
end

