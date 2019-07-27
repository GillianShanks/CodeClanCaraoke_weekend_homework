require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Bar.rb")
require_relative ("../Room.rb")

class BarTest < MiniTest::Test

  def setup()
    @room1 = Room.new("90s Room", 5)
    @room2 = Room.new("80s Room", 10)
    rooms = [@room1, @room2]
    @bar = Bar.new(rooms)

  end

  def test_total_starts_at_zero()
    assert_equal(0, @bar.total)
  end

  def test_add_to_total()
    @bar.add(10)
    assert_equal(10, @bar.total)
  end

  def test_room_count()
    assert_equal(2, @bar.room_count())
  end

  def test_add_rooms_to_total()
    @room1.add_fee(5)
    @room2.add_fee(10)
    @bar.add_room_fees()
    assert_equal(15, @bar.total)
  end
end
