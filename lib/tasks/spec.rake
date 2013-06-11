namespace :spec do
  desc "Run sinatra server specs"
  task :jwui_server do
    ENV["SPEC_ENV"] = "local"
    dir = "spec"
    command = "bundle exec rspec #{dir}"
    puts "Running `#{command}`"
    success = system(command)
    raise "Failed to run '#{command}'" unless success
  end
end

task spec: [:"spec:jwui_server"]
