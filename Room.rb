class Room
  attr_reader :name
  def initialize(name)
    @name = name
    @song_list = []
  end

  def song_list_length()
    return @song_list.count()
  end
end
