gem "minitest"
require "minitest/autorun"
require "on_fork"

class TestOnFork < Minitest::Test
  def test_sanity
    flunk "write tests or I will kneecap you"
  end
end
