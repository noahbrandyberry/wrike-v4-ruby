module WrikeV4
  class Base
    def initialize(options={})
      # API settings
      WrikeV4.api_version  = options.fetch(:api_version) { 'v4' }
      WrikeV4.protocol     = options.fetch(:protocol) { 'https' }
      WrikeV4.api_host     = options.fetch(:api_host) { 'www.wrike.com' }
      # Access settings
      WrikeV4.access_token = options.fetch(:access_token) { '' }
    end

    def site_url
      "#{WrikeV4.protocol}://#{WrikeV4.api_host}"
    end

    # Returns the base url used in all Wrike API calls
    def base_url
      "#{site_url}/api/#{WrikeV4.api_version}"
    end

    def execute(method, url, parameters = {}, request_headers = {}, include_auth_header = true, body = {})
      request_headers = auth_headers(request_headers) if include_auth_header
      # params = {:query => to_j(parameters), headers: request_headers}

      response = Faraday.send(method.to_s, url, body, request_headers)
      response.parsed_response
    end

    private

    def to_j(parameters = {})
      parameters.each do |item|
        if item.last.is_a?(Hash) || item.last.is_a?(Array)
          parameters[item.first.to_s] = item.last.to_json
        end
      end

      parameters
    end

    def auth_headers(options = {})
      options.merge!('Authorization' => "Bearer #{WrikeV4.access_token}")
      options
    end
  end

  class << self
    attr_accessor :api_host,
                  :protocol,
                  :api_version,
                  :access_token

    def configure
      yield self
      true
    end

    alias :config :configure
  end
end