require 'yaml'

module Play
  ##
  # A `play` configuration. Usually loaded from YAML, configured in Ruby, or
  # passed on the command line.
  class Configuration
  
    class << self
      ##
      # A `Configuration` instance that is referenced when a value is not set.
      attr_accessor :default
    end
  
    ##
    # Loads a `Configuration`. If given a string, treats it as a file path to a
    # YAML file from which to load the `Configuration`; if given a Hash, loads
    # it directly.
    def self.load arg
      Configuration.new(arg.is_a?(Hash) ? arg : (YAML.load_file(File.expand_path arg) if File.exist?(File.expand_path arg)))
    end
  
    ##
    # Loads a `Configuration`. If given a string, treats it as a file path to a
    # YAML file from which to load the `Configuration`; if given a Hash, loads
    # it directly.
    def self.dump path
      path = File::expand_path path
      Dir::mkdir File.dirname(path)
      File.open(path, File::CREAT|File::TRUNC|File::RDWR, 0644) do |f|
        f.puts YAML::dump(@settings)
      end
    end
  
    attr_accessor :settings
  
    ##
    # Creates a new `Configuration` instance.
    def initialize arg = nil
      @settings = arg || Hash.new
    end
  
    ##
    # Retrieves a setting from this `Configuration`.
    def [] key
      @settings[key] || (Configuration.default == self ? nil : (Configuration.default.nil? ? nil : Configuration.default[key]))
    end
  
    ##
    # Sets a setting for this `Configuration`.
    def []= key, value
      @settings[key] = value
    end
  
  end
end
