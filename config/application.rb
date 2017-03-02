require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InternationalSpaceStation
  class Application < Rails::Application
    if ENV['GOOGLE_MAPS_TIME_ZONE_API_KEY']
      Timezone::Lookup.config(:google) do |c|
        c.api_key = ENV['GOOGLE_MAPS_TIME_ZONE_API_KEY']
      end
    end
  end
end

Timezone::Lookup.config(:geonames) do |c|
  c.username = 'lucyconklin'
  c.offset_etc_zones = true
end
