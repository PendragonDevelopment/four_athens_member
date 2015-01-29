class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == "admin"
      can :manage, :all

    elsif user.role == "mentor"
      can :manage, Comment, :user_id => user.id
      can :manage, Post, :user_id => user.id
      can :read, Post
      can :manage, Profile, :user_id => user.id
      can :read, Profile
      can :manage, Sheet, :user_id => user.id
      can :read, Skill
      can :read, Slot
      can :create, Slot
      can :manage, Slot, :user_id => user.id

    elsif user.role == "member"
      can :manage, Comment, :user_id => user.id
      can :manage, Post, :user_id => user.id
      can :read, Post
      can :manage, Profile, :user_id => user.id
      can :read, Profile
      can :read, Skill
      can :read, Slot
      can :update, Slot, :user_id => nil
      can :update, Slot, :user_id => user.id
    else

    end
  end
end
