$: << File.dirname(__FILE__)

require "sinatra/base"

require "jwui_server/version"
require "jwui_server/paths"
require "jwui_server/config"

require "jwui_server/sinatra/app"
require "jwui_server/sinatra/routes/main"