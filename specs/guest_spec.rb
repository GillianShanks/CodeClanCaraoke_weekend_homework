require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Guest.rb")

class GuestTest < MiniTest::Test
  def setup()
    @guest1 = Guest.new("Louise", 100, "Bad Touch")
  end

  def test_guest_has_name()
    assert_equal("Louise", @guest1.name)
  end

  def test_guest_has_money()
    assert_equal(100, @guest1.wallet)
  end

  def test_guest_pays()
    @guest1.pays(5)
    assert_equal(95, @guest1.wallet)
  end

  def test_guests_fave_song()
    assert_equal("Bad Touch", @guest1.fav_song)
  end

  def test_woo_for_fav_song()
    song_title = "Bad Touch"
    assert_equal("Woo", @guest1.sees_song(song_title))
  end
end
