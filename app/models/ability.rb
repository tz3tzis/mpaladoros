
class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :read, User 
    return unless user.present?
    can :manage, User, id: user.id
  end
end

class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    can [:read, :update], Admin, id: admin.id
  end
end

class ApplicationController < ActionController::Base
  # overriding CanCan::ControllerAdditions
  def current_ability
    if current_account.kind_of?(AdminUser)
      @current_ability ||= AdminAbility.new(current_account)
    else
      @current_ability ||= UserAbility.new(current_account)
    end
  end
end

