module JwUiServer
  class << self
    def path(*args)
      File.expand_path File.join(File.dirname(__FILE__), "../../", *args)
    end

    alias :root :path
  end
end