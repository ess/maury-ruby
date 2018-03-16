require 'maury/core/pager'
require 'maury/core/result'
require 'maury/environments/entity'

module Maury
  module Environments
    extend Core::Pager

    def self.all(api, params: nil)
      all_pages(
        api: api,
        path: 'environments',
        model: self::Entity,
        params: params,
        root: 'environments'
      )
    end

    def self.for_account(api, account, params: nil)
      all_pages(
        api: api,
        path: "accounts/#{account.id}/environments",
        model: self::Entity,
        params: params,
        root: 'environments'
      )
    end

    def self.find(api, id)
      result = api.get(path: "environments/#{id}")

      unless result.ok?
        return Core::Result.new(
          error: StandardError.new("Could not find environment #{id}")
        )
      end

      Core::Result.new(value: Entity.new(result.value[:environment]))
    end

  end
end
