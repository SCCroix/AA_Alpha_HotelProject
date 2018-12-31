require_relative "room"

class Hotel
  def initialize(name,rooms)
    @name = name
    @rooms = {}
    rooms.each do |name,cap|
      @rooms[name] = Room.new(cap)
    end
  end

  def name
    words = @name.split
    words.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    @rooms.has_key?(name)
  end

  def check_in(person_name,room_name)
    if room_exists?(room_name)
      if @rooms[room_name].full?
        puts "sorry, room is full"
      else
        @rooms[room_name].add_occupant(person_name)
        puts "check in successful"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.any? {|room| !room.full?}
  end

  def list_rooms
    @rooms.each do |room_name,room_obj|
      puts "#{room_name}: #{room_obj.available_space}"
    end
  end
end
