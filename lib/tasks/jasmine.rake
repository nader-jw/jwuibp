begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

namespace :jasmine do
  desc "Run jasmine tests on server"
  task :server do
    require "spec/javascripts/support/jasmine_config"

    config = Jasmine::Config.new
    config.start_server(config.jasmine_rake_port)
    puts "== Jasmine running on http://localhost:#{config.jasmine_rake_port}"
  end
end