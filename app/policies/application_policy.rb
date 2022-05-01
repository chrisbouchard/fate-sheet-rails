# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if scope.respond_to? :for_user
        # It would be nice to just return scope.for_user(user), but that seems
        # to trip up JSONAPI:Resources. It seems to get confused if the WHERE
        # clause contains unexpected joins.
        #
        # Also, we need to accept nil so that we don't reject a resource with a
        # NULL associated resource. The associated resources will be LEFT OUTER
        # JOINED to the requested resource, so not allowing NULL rejects the
        # whole row.
        scope.where(id: [nil, scope.for_user(user)])
      else
        scope.all
      end
    end
  end
end
