require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Song.rb")

class SongTest < MiniTest::Test
  def setup()
    @song1 = Song.new("The Bad Touch", "Blood Hound Gang")
  end

  def test_can_get_title()
    assert_equal("The Bad Touch", @song1.title)
  end

  def test_can_get_artist()
    assert_equal("Blood Hound Gang", @song1.artist)
  end
end
