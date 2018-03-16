require 'maury/core/entity'

module Maury
  module Users
    class Entity < Core::Entity
      attribute :id, Core::Types::Coercible::String
      attribute :name, Core::Types::String
      attribute :email, Core::Types::String
      attribute :role, Core::Types::String
      attribute :api_token, Core::Types::String
      attribute :verified, Core::Types::Bool
      attribute :staff, Core::Types::Bool
      attribute :created_at, Core::Types::String
      attribute :deleted_at, Core::Types::String
      attribute :updated_at, Core::Types::String
    end
  end
end
