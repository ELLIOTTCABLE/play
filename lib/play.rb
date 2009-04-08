require 'play/configuration'

##
# `Play` is a simple system for playing media from the command line.
module Play
  Version = 4
  
  ##
  # This method is responsible for ferreting out a particular piece of media,
  # and playing it.
  def self.Play parameters, options = Configuration.new
    
  end
  
  ##
  # Sets up the default configuration for `play`.
  def self.configure &block
    Configuration.default = Configuration.new &block
  end
  
end

def Play(*args); Play::Play(*args); end
