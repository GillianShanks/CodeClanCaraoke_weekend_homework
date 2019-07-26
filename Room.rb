class Room
  attr_reader :name, :max_guests
  def initialize(name, max_guests)
    @name = name
    @song_list = []
    @checked_in = []
    @max_guests = max_guests
  end

  def song_list_length()
    return @song_list.count()
  end

  def checked_in_count()
    return @checked_in.count()
  end

  def queue_song(song)
    @song_list << song
  end

  def add(guest)
    @checked_in << guest
  end

  def remove(guest)
    @checked_in.delete(guest)
  end

  def room_full?()
    return checked_in_count() == @max_guests
  end

end
