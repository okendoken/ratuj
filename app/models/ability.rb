class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Problem do |problem|
      problem.user == user
    end
  end
end
