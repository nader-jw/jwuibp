module JwUiServer
  module Sinatra
    class App < ::Sinatra::Base

      # Settings
      enable :static

      set :public_folder, "public"
      set :views, "public/views"
      set :port, JwUiServer::Config.get("server.port")

    end
  end
end