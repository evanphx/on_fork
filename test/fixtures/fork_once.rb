STDOUT.sync = true

lib = File.expand_path('../../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'on_fork'

OnFork.add do
  puts "after fork"
end

puts "booted"

Process.fork

puts "finished"
