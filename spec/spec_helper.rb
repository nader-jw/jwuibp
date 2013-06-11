$:.unshift File.join(File.dirname(__FILE__), "../")

require "rspec"
require "capybara"
require "selenium-webdriver"
require "lib/jwui_server"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_wait_time = 10
Capybara.default_selector = :css
Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome

Capybara.app = JwUiServer::Sinatra::App
Capybara.app_host = "http://localhost:61026"
Capybara.server_port = 61026
Capybara.run_server = true

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Capybara::DSL
end
