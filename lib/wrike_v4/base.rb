module WrikeV4
  class Base
    class << self
      def site_url
        "#{WrikeV4.protocol}://#{WrikeV4.api_host}"
      end

      def base_url
        "#{site_url}/api/#{WrikeV4.api_version}"
      end

      def nested_path(path = '', type = nil, id = nil)
        path = "#{type}/#{id}/#{path}" if type && id
        path
      end

      def execute(method, path, parameters = {}, request_headers = {}, include_auth_header = true)
        request_headers = auth_headers(request_headers) if include_auth_header
        api = Faraday.new(url: base_url, params: parameters, headers: request_headers) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response :json
        end

        response = api.send(method.to_s, path)

        response.body['data']
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
  end
end