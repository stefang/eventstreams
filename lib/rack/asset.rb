require "haml"
require "sass"
require "sass/plugin"

module Rack
  class Asset < Rack::File
    
    attr_accessor :root
    
    def initialize app
      @app           = app
      @root          = ::File.expand_path("assets")

      Sass::Plugin.options[:template_location] = {
        @root+"/stylesheets/sass" => @root+"/stylesheets",
        @root+"/stylesheets/themes/sass" => @root+"/stylesheets/themes" 
      }
      
    end
    
    def call env 
      @server_name = env["HTTP_HOST"]
      @path_info = Utils.unescape(env["PATH_INFO"])
      Sass::Plugin.update_stylesheets
      return forbidden  if @path_info.include? ".."
      if @server_name.match(/assets\./)
         begin
           if file
             serving
           else
             raise Errno::EPERM
           end
         rescue SystemCallError
           not_found
         end
      else
        @app.call env 
      end
    end
    
    def file
      @path = exists?
    end
    
    def exists?
      f = F.join(@root, @path_info)
      F.file?(f) && F.readable?(f) ? f : nil
    end
    
  end
end