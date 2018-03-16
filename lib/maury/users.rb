require 'maury/core/pager'
require 'maury/core/result'
require 'maury/users/entity'

module Maury
  module Users
    extend Core::Pager

    def self.all(api, params: nil)
      all_pages(
        api: api,
        path: 'users',
        model: self::Entity,
        params: params,
        root: 'users'
      )
    end

    def self.current(api)
      result = api.get(path: 'users/current')

      unless result.ok?
        return Core::Result.new(error: "Could not get the current user")
      end

      Core::Result.new(value: Entity.new(result.value[:user]))
    end
  end
end
