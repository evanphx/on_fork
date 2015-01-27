gem "minitest"
require "minitest/autorun"
require "on_fork/shims"

module TestOnFork; end

class TestOnFork::TestShims < Minitest::Test
  def test_sanity
    flunk "write tests or I will kneecap you"
  end
end
