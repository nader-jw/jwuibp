require "rubygems"
require "bundler"
Bundler.setup
require 'sprockets'
require "./lib/jwui_server"

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/javascripts'
  environment.append_path 'app/stylesheets'
  run environment
end

map '/' do
  run JwUiServer::Sinatra::App
end