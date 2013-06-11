module JwUiServer
  module Sinatra
    class App < ::Sinatra::Base

      get "/" do
        erb :index, locals: {gem_version: JwUiServer::VERSION}
      end

    end
  end
end
