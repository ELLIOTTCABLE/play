($:.unshift File.expand_path(File.join( File.dirname(__FILE__), 'lib' ))).uniq!
require 'play'

require 'fileutils'

# =======================
# = Gem packaging tasks =
# =======================
begin
  require 'echoe'
  
  task :install => :'package:install'
  task :package => :'package:package'
  task :manifest => :'package:manifest'
  namespace :package do
    Echoe.new('play', Play::Version) do |g|
      g.author = ['elliottcable']
      g.email = ['Play@elliottcable.com']
      g.summary = 'Playing media LIKE A BOSS'
      g.url = 'http://github.com/elliottcable/play'
      g.development_dependencies = ['echoe >= 3.0.2']
      g.bin_files = ['bin/play']
      g.manifest_name = '.manifest'
      g.retain_gemspec = true
      g.rakefile_name = 'Rakefile.rb'
      g.ignore_pattern = /^\.git\/|\.gemspec/
    end
  end
  
rescue LoadError
  desc 'You need the `echoe` gem to package Play'
  task :package
end

# =========
# = Other =
# =========
desc 'Removes all meta producs'
task :clobber => :'package:clobber_package' do
  `rm -rf #{File.expand_path(File.join( File.dirname(__FILE__), 'meta' ))}`
end

desc 'Check everything over before commiting'
task :aok => [:'package:manifest']

task :ci => []
