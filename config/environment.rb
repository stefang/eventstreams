# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

require 'geokit'
require 'twitter'

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
end

DO_NOT_REPLY = "donotreply@eventstreamsapp.com"
Haml::Template.options[:format] = :html5

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :dmy_long => Proc.new { |date| "#{date.day.ordinalize} #{date.strftime '%B %Y'}" }
)

ActiveSupport::CoreExtensions::Range::Conversions::RANGE_FORMATS.merge!(
  :condensed => Proc.new do |start, stop|
    if (start.year == stop.year) and (start.month == stop.month)
      "#{start.day.ordinalize} - #{stop.to_date.to_s(:dmy_long)}"
    else
      "#{start.to_date.to_s(:dmy_long)} to #{stop.to_date.to_s(:dmy_long)}"
    end
  end
)