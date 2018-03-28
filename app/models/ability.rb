class Ability
  include CanCan::Ability

  def initialize(user)
    # TODO: reimplement the ability
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
