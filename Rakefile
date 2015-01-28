# -*- ruby -*-

require "rubygems"
require "hoe"

# Hoe.plugin :compiler
# Hoe.plugin :gem_prelude_sucks
# Hoe.plugin :git
# Hoe.plugin :ignore
# Hoe.plugin :inline
# Hoe.plugin :minitest
# Hoe.plugin :racc
# Hoe.plugin :rcov
# Hoe.plugin :rdoc

HOE = Hoe.spec "on_fork" do
  # HEY! If you fill these out in ~/.hoe_template/default/Rakefile.erb then
  # you'll never have to touch them again!
  # (delete this comment too, of course)
  #
  developer "Evan Phoenix", "evan@phx.io"
  self.readme_file = "README.md"
  license "MIT"
end

file "#{HOE.spec.name}.gemspec" => ['Rakefile'] do |t|
  puts "Generating #{t.name}"
  File.open(t.name, 'wb') { |f| f.write HOE.spec.to_ruby }
end

desc "Generate or update the standalone gemspec file for the project"
task :gemspec => ["#{HOE.spec.name}.gemspec"]


# vim: syntax=ruby
