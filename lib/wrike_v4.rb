require 'faraday'
require 'faraday_middleware'

require 'wrike_v4/base'
require 'wrike_v4/folder'
require 'wrike_v4/contact'


module WrikeV4
  class << self
    attr_accessor :api_host, :protocol, :api_version, :access_token
    
    def api_version
      @api_version || 'v4'
    end

    def protocol
      @protocol || 'https'
    end

    def api_host
      @api_host || 'www.wrike.com'
    end
  
    def configure
      yield self
      true
    end
  
    alias :config :configure
  end
end
