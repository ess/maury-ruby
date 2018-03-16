require 'maury/core/entity'

module Maury
  module Accounts
    class Entity < Core::Entity
      attribute :id, Types::String
      attribute :name, Types::String
      attribute :plan, Types::String
      attribute :support_plan, Types::String
      attribute :type, Types::String
      attribute :canceled_at, Types::String
      attribute :created_at, Types::String
      attribute :updated_at, Types::String
      attribute :user_id, Types::String
    end
  end
end
