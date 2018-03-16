require 'maury/core/entity'

module Maury
  module Environments
    class Entity < Core::Entity
      attribute :id, Core::Types::Int
      attribute :name, Core::Types::String
      attribute :database_stack, Core::Types::String
      attribute :deploy_method, Core::Types::String
      attribute :framework_env, Core::Types::String
      attribute :internal_private_key, Core::Types::String
      attribute :internal_public_key, Core::Types::String
      attribute :language, Core::Types::String
      attribute :region, Core::Types::String
      attribute :release_label, Core::Types::String
      attribute :service_level, Core::Types::String
      attribute :service_plan, Core::Types::String
      attribute :stack_name, Core::Types::String
      attribute :user_name, Core::Types::String
      attribute :created_at, Core::Types::String
      attribute :deleted_at, Core::Types::String
      attribute :updated_at, Core::Types::String
    end
  end
end
