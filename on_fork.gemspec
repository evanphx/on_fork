# -*- encoding: utf-8 -*-
# stub: on_fork 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "on_fork"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evan Phoenix"]
  s.date = "2015-01-27"
  s.description = "A way to manage code that should run when a process is forked"
  s.email = ["evan@phx.io"]
  s.executables = ["on_fork"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", ".gemtest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/on_fork", "lib/on_fork.rb", "test/test_on_fork.rb"]
  s.homepage = "http://github.com/evanphx/on_fork"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.txt"]
  s.rubygems_version = "2.2.2"
  s.summary = "A way to manage code that should run when a process is forked"
  s.test_files = ["test/test_on_fork.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.13"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.13"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.13"])
  end
end
