class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Problem do |problem|
      problem.user == user
    end
    can :manage, Comment do |comment|
      comment.user == user
    end
  end
end
