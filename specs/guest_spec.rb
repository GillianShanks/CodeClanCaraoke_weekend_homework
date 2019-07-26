require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Guest.rb")

class GuestTest < MiniTest::Test
  def setup()
    @guest1 = Guest.new("Louise")
  end

  def test_guest_has_name()
    assert_equal("Louise", @guest1.name)
  end
end
