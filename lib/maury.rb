require 'maury/accounts'
require 'maury/addresses'
require 'maury/client'
require 'maury/environments'
require 'maury/provider_locations'
require 'maury/servers'
require 'maury/users'
require "maury/version"

module Maury
  def self.client(base_url: 'https://api.engineyard.com', token: nil)
    Client.new(base_url: base_url, token: token)
  end

  def self.accounts
    Accounts
  end

  def self.addresses
    Addresses
  end

  def self.users
    Users
  end

  def self.environments
    Environments
  end

  def self.servers
    Servers
  end

  def self.provider_locations
    ProviderLocations
  end
end
