class RentPolicy < ApplicationPolicy
  def initialize(user, rent)
    @user = user
    @rent = rent
  end

  class Scope
    def resolve
      scope.where(user: user)
    end
  end
end
