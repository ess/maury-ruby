require 'maury/core/entity'

module Maury
  module Servers
    class Flavor < Core::Entity
      attribute :id, Core::Types::String
    end

    class Entity < Core::Entity
      attribute :id, Core::Types::Int
      attribute :provisioned_id, Core::Types::String
      attribute :role, Core::Types::String

      attribute :dedicated, Core::Types::Bool.default(false)
      attribute :enabled, Core::Types::Bool.default(false)
      attribute :location, Core::Types::String
      attribute :name, Core::Types::String
      attribute :private_hostname, Core::Types::String
      attribute :public_hostname, Core::Types::String
      attribute :release_label, Core::Types::String
      attribute :state, Core::Types::String

      attribute :flavor, Flavor
      
      attribute :created_at, Core::Types::String
      attribute :deleted_at, Core::Types::String
      attribute :deprovisioned_at, Core::Types::String
      attribute :provisioned_at, Core::Types::String
      attribute :updated_at, Core::Types::String

      attribute :environment_id, Core::Types::Int
    end
  end
end
