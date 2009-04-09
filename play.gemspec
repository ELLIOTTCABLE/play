# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{play}
  s.version = "4"
  
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["elliottcable"]
  s.date = %q{2009-04-09}
  s.default_executable = %q{play}
  s.description = %q{Playing media LIKE A BOSS}
  s.email = ["Play@elliottcable.com"]
  s.executables = ["play"]
  s.extra_rdoc_files = ["bin/play", "lib/play/configuration.rb", "lib/play.rb", "README.markdown"]
  s.files = ["bin/play", "config.example.yaml", "lib/play/configuration.rb", "lib/play.rb", "Rakefile.rb", "README.markdown", ".manifest", "play.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/elliottcable/play}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Play", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{play}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Playing media LIKE A BOSS}
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
    
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    else
      s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
  end
end
