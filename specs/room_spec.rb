require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Room.rb")
require_relative ("../Song.rb")
require_relative ("../Guest.rb")

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new("90s Room")
    @song1 = Song.new("The Bad Touch", "Blood Hound Gang")
  end

  def test_can_get_room_name()
    assert_equal("90s Room", @room1.name)
  end

  def test_song_list_starts_empty()
    assert_equal(0, @room1.song_list_length())
  end

end
