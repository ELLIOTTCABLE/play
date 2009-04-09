require 'play/configuration'

##
# `Play` is a simple system for playing media from the command line.
module Play
  Version = 4
  
  ##
  # This method is responsible for ferreting out a particular piece of media,
  # and playing it.
  def self.Play parameters, options = Configuration.new
    query, season, episode = parameters
    
    files = options[:directories].inject(Array.new) do |acc, dir|
      options[:extensions].inject(acc) {|acc, ext| acc + Dir[File.expand_path File.join(dir, '**', ['*', ext].join('.'))] }
    end.select do |file|
      queries = [[query]]
      queries << ["#{season}x", "S#{season}", "Season #{season}"] if season
      queries << ["x#{episode}", "E#{episode}", "Episode #{episode}"] if episode
      queries.all? {|a| a.any? {|e| file.include? e }}
    end.reject {|file| file =~ /sample/i }
    
    if options[:latest]
      # TODO: This should really parse the episode number and shit.
      file = files.sort {|f1, f2| File.size(f1) <=> File.size(f2) }.last
    else
      files.each.with_index {|file, i| puts "#{i + 1}: #{file}"}
      print "Please select a number: "
      file = files[STDIN.gets.chomp.to_i - 1]
    end
    
    args = [options[:player], file]
    args += ['-vf', "expand=" + [:top, :bottom, :left, :right].map {|side| "-" + (options[["padding", side].join('_').intern] || 0).to_s}.join(':')]
    args += ['-ss', options[:spot].to_s] if options[:spot]
    system *args
  end
  
  ##
  # Sets up the default configuration for `play`.
  def self.configure &block
    Configuration.default = Configuration.new &block
  end
  
end

def Play(*args); Play::Play(*args); end
