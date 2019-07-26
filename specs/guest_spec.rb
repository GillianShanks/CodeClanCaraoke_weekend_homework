require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Guest.rb")

class GuestTest < MiniTest::Test
  def setup()
    @guest1 = Guest.new("Louise", 100)
  end

  def test_guest_has_name()
    assert_equal("Louise", @guest1.name)
  end

  def test_guest_has_money()
    assert_equal(100, @guest1.wallet)
  end
end
