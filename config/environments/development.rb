# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Sessions across subdomains

COOKIE_DOMAIN = '.eventstreams.local'

DO_NOT_REPLY = "donotreply@eventstreams.local"

ActionController::Base.asset_host = "assets" + COOKIE_DOMAIN

if ActionController::Base.session
  ActionController::Base.session[:domain] = COOKIE_DOMAIN
else
  ActionController::Base.session = { :domain => COOKIE_DOMAIN }
end

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

HOST = "localhost"

Paperclip.options[:image_magick_path] = "/opt/local/bin"

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "eventstreamsapp.com",
  :authentication => :plain,
  :user_name => "donotreply@eventstreamsapp.com",
  :password => "34Kl34"
}
