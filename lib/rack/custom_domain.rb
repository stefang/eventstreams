module Rack
  class CustomDomain
    def initialize app
      @app = app
    end
    def call env 
      # env["HTTP_HOST"] = "firstevent.eventstreams.local"
      event = Event.find_by_custom_domain(env["HTTP_HOST"])
      if event
        env["HTTP_HOST"] = "#{event.subdomain}#{COOKIE_DOMAIN}"
      end
      @app.call(env)
    end
  end
end