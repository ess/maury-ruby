require 'dry-struct'
require 'maury/core/types'

module Maury
  module Core
    class Entity < Dry::Struct
      constructor_type :schema
    end
  end
end
