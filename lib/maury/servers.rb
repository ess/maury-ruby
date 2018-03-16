require 'maury/core/pager'
require 'maury/core/result'
require 'maury/servers/entity'

module Maury
  module Servers
    extend Core::Pager

    def self.all(api, params: nil)
      all_pages(
        api: api,
        path: 'servers',
        model: self::Entity,
        params: params,
        root: 'servers'
      )
    end

    def self.for_account(api, account, params: nil)
      all_pages(
        api: api,
        path: "accounts/#{account.id}/servers",
        model: self::Entity,
        params: params,
        root: 'servers'
      )
    end

    def self.for_environment(api, environment, params: nil)
      all_pages(
        api: api,
        path: "environments/#{environment.id}/servers",
        model: self::Entity,
        params: params,
        root: 'servers'
      )
    end

    def self.find(api, id)
      result = api.get(path: "servers/#{id}")

      unless result.ok?
        return Core::Result.new(
          error: StandardError.new("Could not find server #{id}")
        )
      end

      Core::Result.new(value: Entity.new(result.value[:server]))
    end

  end
end
