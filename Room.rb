class Room
  attr_reader :name, :max_guests, :entry_fee, :till
  def initialize(name, max_guests)
    @name = name
    @song_list = []
    @checked_in = []
    @max_guests = max_guests
    @entry_fee = 5
    @till = 0
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

  def check_in(guest)
    if can_pay?(guest)
      if !room_full?()
        add(guest)
        guest.pays(@entry_fee)
        add_fee(@entry_fee)
      end
    end
    return "No Entry."
  end

  def can_pay?(guest)
    return guest.wallet >= @entry_fee
  end

  def add_fee(fee)
    @till += fee
  end

end
