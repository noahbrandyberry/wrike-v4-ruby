require 'faraday'

require 'wrike_v4/base'

def WrikeV4(options={})
  options[:access_token] = WrikeV4.access_token if WrikeV4.access_token
  WrikeV4::Base.new(options)
end