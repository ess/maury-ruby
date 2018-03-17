require 'maury/core/entity'

module Maury
  module Addresses
    class Entity < Core::Entity
      attribute :id,          Core::Types::Int
      attribute :provisioned_id, Core::Types::String
      
      attribute :server, Core::Types::String
      attribute :location, Core::Types::String
      attribute :provider, Core::Types::String

      attribute :created_at, Core::Types::String
      attribute :updated_at, Core::Types::String
    end
  end
end
