require 'maury/core/pager'
require 'maury/core/result'
require 'maury/addresses/entity'

module Maury
  module Addresses
    extend Core::Pager

    def self.all(api, params: nil)
      all_pages(
        api: api,
        path: 'addresses',
        model: self::Entity,
        params: params,
        root: 'addresses'
      )
    end

    def self.for_account(api, account, params: nil)
      all_pages(
        api: api,
        path: "accounts/#{account.id}/addresses",
        model: self::Entity,
        params: params,
        root: 'addresses'
      )
    end

    def self.for_provider(api, provider, params: nil)
      all_pages(
        api: api,
        path: "providers/#{provider.id}/addresses",
        model: self::Entity,
        params: params,
        root: 'addresses'
      )
    end


    def self.find(api, id)
      result = api.get(path: "addresses/#{id}")

      unless result.ok?
        return Core::Result.new(
          error: StandardError.new("Could not find address #{id}")
        )
      end

      Core::Result.new(value: Entity.new(result.value[:address]))
    end

  end
end
