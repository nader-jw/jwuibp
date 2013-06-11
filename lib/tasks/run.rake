desc "Running application server and jasmine tests server"
task :run do
  system "bundle exec thin start -p #{JwUiServer::Config.get("server.port")} & bundle exec rake jasmine JASMINE_PORT=#{JwUiServer::Config.get("jasmine.port")}"
end