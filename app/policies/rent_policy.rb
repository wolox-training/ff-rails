class RentPolicy < ApplicationPolicy
  class Scope
    def resolve
      scope.where(user: user)
    end
  end
end
