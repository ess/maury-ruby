require 'maury/core/pager'
require 'maury/core/result'
require 'maury/provider_locations/entity'

module Maury
  module ProviderLocations
    extend Core::Pager

    def self.all(api, params: nil)
      all_pages(
        api: api,
        path: 'provider_locations',
        model: self::Entity,
        params: params,
        root: 'provider_locations'
      )
    end

    def self.for_location(api, location, params: nil)
      all_pages(
        api: api,
        path: "provider_locations/#{location.id}/provider_locations",
        model: self::Entity,
        params: params,
        root: 'provider_locations'
      )
    end

    def self.for_provider(api, provider, params: nil)
      all_pages(
        api: api,
        path: "providers/#{provider.id}/locations",
        model: self::Entity,
        params: params,
        root: 'provider_locations'
      )
    end

    def self.find(api, id)
      result = api.get(path: "provider_locations/#{id}")

      unless result.ok?
        return Core::Result.new(
          error: StandardError.new("Could not find environment #{id}")
        )
      end

      Core::Result.new(value: Entity.new(result.value[:provider_location]))
    end

  end
end
