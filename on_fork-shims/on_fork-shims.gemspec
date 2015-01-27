# -*- encoding: utf-8 -*-
# stub: on_fork-shims 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "on_fork-shims"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evan Phoenix"]
  s.date = "2015-01-27"
  s.description = "Provide shims to cleanup external dependencies behavior with regard to fork."
  s.email = ["evan@phx.io"]
  s.executables = ["shims"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", ".gemtest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/on_fork/shims", "bin/shims", "lib/on_fork/shims.rb", "test/on_fork/test_shims.rb", "test/test_on_fork/shims.rb"]
  s.homepage = "https://github.com/evanphx/on_fork/on_fork-shims"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.txt"]
  s.rubygems_version = "2.2.2"
  s.summary = "Provide shims to cleanup external dependencies behavior with regard to fork."
  s.test_files = ["test/on_fork/test_shims.rb"]

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
