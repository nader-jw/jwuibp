$: << File.dirname(__FILE__)

require "rake"
require "yaml"
require "rspec"
require "jasmine"
require "rspec/core/rake_task"
require "lib/jwui_server"

Dir[JwUiServer.root("lib/tasks/**/*.rake")].each { |f| load f }

task :default => [:"jslint", :"jasmine:ci", :"spec"]