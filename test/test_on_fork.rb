require 'test_helper'

class TestOnFork < Minitest::Unit::TestCase

  def test_forking_once
    program = SpawnHelper.new("fork_once.rb").spawn
    expected = <<-EOF
booted
after fork
finished
finished
EOF
    program.wait %r{finished}
    assert_equal expected, program.log.read
  ensure
    program.cleanup
  end
end
