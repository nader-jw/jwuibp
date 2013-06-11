require "yaml"
require "confstruct"

module JwUiServer
  class Config < Confstruct::Configuration
    def initialize(file="config/application.yml")
      yaml = YAML.load_file(JwUiServer.path(file))
      super(yaml)
    end

    def get(key, fallback=nil)
      lookup! key.to_s, fallback
    end

    class << self
      def get(*args)
        new.get *args
      end
    end
  end
end