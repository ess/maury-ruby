require 'maury/core/pager'
require 'maury/core/result'
require 'maury/accounts/entity'

module Maury
  module Accounts
    extend Core::Pager

    def self.all(api, params: nil)
      all_pages(
        api: api,
        path: 'accounts',
        model: self::Entity,
        params: params,
        root: 'accounts'
      )
    end

    def self.for_user(api, user, params: nil)
      all_pages(
        api: api,
        path: "users/#{user.id}/accounts",
        model: self::Entity,
        params: params,
        root: 'accounts'
      )
    end

    def self.find(api, id)
      result = api.get(path: "accounts/#{id}")

      unless result.ok?
        return Core::Result.new(
          error: StandardError.new("Could not find account #{id}")
        )
      end

      Core::Result.new(value: Entity.new(result.value[:account]))
    end

    def self.update(api, account, params: nil, data:)
      if !data.is_a?(Hash)
        return Core::Result.new(
          error: ArgumentError.new(":data must be a Hash")
        )
      end

      result = api.put(
        "accounts/#{account.id}",
        params: params,
        data: {account: data}
      )

      unless result.ok?
        return Result.new(
          error: "Could not update account #{account.id}: #{result.error}"
        )
      end

      Entity.new(result.value[:account])
    end
  end
end
