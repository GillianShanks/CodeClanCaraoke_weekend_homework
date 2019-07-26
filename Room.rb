class Room
  attr_reader :name
  def initialize(name)
    @name = name
    @song_list = []
    @checked_in = []
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
end
