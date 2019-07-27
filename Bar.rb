require("pry-byebug")
class Bar
  attr_reader :total
  def initialize(rooms)
    @rooms = rooms
    @total = 0
  end

  def add(money)
    return @total += money
  end

  def room_count()
    return @rooms.count()
  end

  def add_room_fees()
    @total = @rooms.map{|room| room.till}.reduce{|total, till| total + till}
  end

  def collect_room_fees()
    add_room_fees()
    @rooms.each{|room| room.reset_till}
  end

end
