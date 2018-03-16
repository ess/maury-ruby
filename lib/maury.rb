require 'maury/accounts'
require 'maury/client'
require 'maury/users'
require "maury/version"

module Maury
  def self.client(base_url: 'https://api.engineyard.com', token: nil)
    Client.new(base_url: base_url, token: token)
  end

  def self.accounts
    Accounts
  end

  def self.users
    Users
  end
end
