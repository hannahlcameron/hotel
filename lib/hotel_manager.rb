module Hotel
  class HotelManager

    RATE = 200

    attr_reader :room_list
    attr_accessor :reservations

    def initialize

      @room_list = load_rooms
      @reservations = []

    end

    def load_rooms
      room_list = Array('1'..'20')
      return room_list
    end

  end # end of class
end # end of module
