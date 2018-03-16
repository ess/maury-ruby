require 'addressable'
require 'faraday'
require 'json'

require 'maury/core/result'

module Maury
  class Client
    def initialize(base_url: 'https://api.engineyard.com', token: nil)
      @base_url = Addressable::URI.parse(base_url)
      @token = token
    end

    def get(path:, params: nil)
      make_request(verb: :get, path: path, params: params)
    end

    def post(path:, params: nil, data: nil)
      make_request(verb: :post, path: path, params: params, data: data)
    end

    def put(path:, params: nil, data: nil)
      make_request(verb: :put, path: path, params: params, data: data)
    end

    def patch(path:, params: nil, data: nil)
      make_request(verb: :patch, path: path, params: params, data: data)
    end

    def delete(path:, params: nil)
      make_request(verb: :delete, path: path, params: params)
    end

    private
    def construct_request_url(path)
      base_url.tap do |url|
        url.path = path

        return url
      end
    end

    def make_request(verb:, path:, params: nil, data: nil)
      begin
        data = JSON.encode(data) unless data.nil?
      rescue
        return Core::Result.new(error: "Could not encode your data as JSON")
      end

      verb = verb.to_s.downcase.to_sym
      url = construct_request_url(path)

      response = connector.run_request(verb, url, data, nil) {|request|
        request.params.update(params) if params
      }

      process_response(response)
    end

    def process_response(response)
      status = response.status.to_i

      if status > 299
        return Core::Result.new(error: "The API returned the following status: #{status}")
      end

      begin
        parsed = JSON.parse(response.body, symbolize_names: true)
      rescue
        return Core::Result.new(error: "The API did not respond with valild JSON")
      end

      return Core::Result.new(value: parsed)
    end

    def connector
      @connector ||= Faraday.new(url: base_url) do |faraday|
        {
          'Content-Type' => 'application/json',
          'Accept' => 'application/vnd.engineyard.v3+json',
          'Host' => host,
          'X-EY-TOKEN' => token,
          'User-Agent' => 'maury/0.1.0 (https://github.com/ess/maury-ruby)'
        }

        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def base_url
      @base_url
    end

    def token
      @token
    end

    def host
      base_url.host
    end
  end
end
