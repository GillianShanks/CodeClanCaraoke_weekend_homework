require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Room.rb")
require_relative ("../Song.rb")
require_relative ("../Guest.rb")

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new("90s Room", 5)
    @song1 = Song.new("The Bad Touch", "Blood Hound Gang")
    @song2 = Song.new("Umbrella", "Rhianna")
    @guest1 = Guest.new("Louise", 100, "The Bad Touch")
    @guest2 = Guest.new("Ally", 4, "Umbrella")
  end

  def test_can_get_room_name()
    assert_equal("90s Room", @room1.name)
  end

  def test_song_list_starts_empty()
    assert_equal(0, @room1.song_list_length())
  end

  def test_checked_in_guests_starts_at_zero()
    assert_equal(0, @room1.checked_in_count())
  end

  def test_add_song_to_queue()
    @room1.queue_song(@song1, @guest1)
    assert_equal(1, @room1.song_list_length())
  end

  def test_add_guest_to_list()
    @room1.add(@guest1)
    assert_equal(1, @room1.checked_in_count())
  end

  def test_remove_guest_from_list()
    @room1.add(@guest1)
    @room1.add(@guest2)
    @room1.remove(@guest1)
    assert_equal(1, @room1.checked_in_count())
  end

  def test_get_rooms_max_numb_of_guests()
    assert_equal(5, @room1.max_guests)
  end

  def test_is_room_full__false()
    @room1.add(@guest1)
    assert_equal(false, @room1.room_full?())
  end

  def test_is_room_full__true()
    @room1.add(@guest1)
    @room1.add(@guest1)
    @room1.add(@guest1)
    @room1.add(@guest1)
    @room1.add(@guest1)
    assert_equal(true, @room1.room_full?())
  end

  def test_check_in_guest__room_has_space_has_money()
    @room1.check_in(@guest1)
    assert_equal(1, @room1.checked_in_count())
    assert_equal(95, @guest1.wallet)
    assert_equal(5, @room1.till)
  end

  def test_check_in_guest__room_full_not_pay()
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    #till is 25
    assert_equal("No Entry.", @room1.check_in(@guest2))
    assert_equal(5, @room1.checked_in_count())
    assert_equal(4, @guest2.wallet)
    assert_equal(25, @room1.till)
  end

  def test_get_entry_fee()
    assert_equal(5, @room1.entry_fee)
  end

  def test_can_guest_pay__yes()
    assert_equal(true, @room1.can_pay?(@guest1))
  end

  def test_can_guest_pay__no()
    assert_equal(false, @room1.can_pay?(@guest2))
  end

  def test_check_in_guest__room_full_has_money()
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    #wallet is 75 after 5 entries of 5, till is 25
    assert_equal("No Entry.", @room1.check_in(@guest1))
    assert_equal(5, @room1.checked_in_count())
    assert_equal(75, @guest1.wallet)
    assert_equal(25, @room1.till)
  end

  def test_add_money_to_till()
    @room1.add_fee(5)
    assert_equal(5, @room1.till)
  end

  def test_guests_fav_song_on_playlist()
    @room1.queue_song(@song1, @guest1)
    assert_equal("Woo", @room1.check_song_list(@guest1))
  end

  def test_reset_till()
    @room1.add_fee(5)
    assert_equal(0, @room1.reset_till())

  end

  # def test_remove_entry()
  #   @room1.queue_song(@song1, @guest1)
  #   @room1.remove_entry
  # end

  def test_remove_songs_from_playlist_by_guest__many_songs()
    @room1.queue_song(@song1, @guest1)
    @room1.queue_song(@song2, @guest1)
    @room1.remove_songs(@guest1)
    assert_equal(0, @room1.song_list_length())
  end

  def test_check_out_guest_removing_songs()
    @room1.add(@guest1)
    @room1.add(@guest2)
    @room1.queue_song(@song1, @guest1)
    @room1.queue_song(@song2, @guest1)
    @room1.queue_song(@song1, @guest2)
    @room1.queue_song(@song2, @guest2)
    #currently: guests==2, songs==4
    @room1.check_out(@guest1)
    assert_equal(1, @room1.checked_in_count())
    assert_equal(2, @room1.song_list_length())
  end


end
