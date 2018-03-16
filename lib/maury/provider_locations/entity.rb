require 'maury/core/entity'

module Maury
  module ProviderLocations
    class Limits < Core::Entity
      attribute :servers, Core::Types::Int
      attribute :addresses, Core::Types::Int
    end

    class Entity < Core::Entity
      attribute :id, Core::Types::String
      attribute :location_id, Core::Types::String
      attribute :location_name, Core::Types::String
      attribute :limits, Limits
      attribute :created_at, Core::Types::String
      attribute :disabled_at, Core::Types::String
      attribute :updated_at, Core::Types::String
    end
  end
end
