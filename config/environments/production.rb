# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

COOKIE_DOMAIN = '.eventstreamsapp.com'

ActionController::Base.asset_host = "assets" + COOKIE_DOMAIN

if ActionController::Base.session
  ActionController::Base.session[:domain] = COOKIE_DOMAIN
else
  ActionController::Base.session = { :domain => COOKIE_DOMAIN }
end

# See everything in the log (default is :info)
# config.log_level = :debug

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# Enable threaded mode
# config.threadsafe!

HOST = "eventstreamsapp.com"
DO_NOT_REPLY = "Eventstreams <donotreply@eventstreamsapp.com>"

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "eventstreamsapp.com",
  :authentication => :plain,
  :user_name => "donotreply",
  :password => "34Kl34"
}

Paperclip.options[:image_magick_path] = "/usr/local/bin"