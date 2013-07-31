# See the wiki for details:
# https://github.com/ryanb/cancan/wiki/Defining-Abilities

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is_admin?
      can :manage, :all
    else
      can :read, [Country, Currency]
      can [:pie_chart, :line_chart, :visit_multiple], Country
      can [:pie_chart, :line_chart, :collect_multiple], Currency
      can :manage, UserCountry, user_id: user.id
    end
  end
end
