require 'maury/core/entity'

module Maury
  module Accounts
    class Entity < Core::Entity
      attribute :id, Core::Types::String
      attribute :name, Core::Types::String
      attribute :plan, Core::Types::String
      attribute :support_plan, Core::Types::String
      attribute :type, Core::Types::String
      attribute :canceled_at, Core::Types::String
      attribute :created_at, Core::Types::String
      attribute :updated_at, Core::Types::String
      attribute :user_id, Core::Types::String
    end
  end
end
