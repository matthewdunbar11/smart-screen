class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, Display, user_id: user.id
    can :manage, Screen, display: { user_id: user.id }
  end
end
