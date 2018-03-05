module Hotel
  class Reservation

    attr_accessor :reservation_id, :room_id, :check_in, :check_out

    def initialize
      @reservation_id = get_reservation_id
      @room_id = room_id
      @check_in = check_in
      @check_out = check_out
    end

  end # end of class
end # end of module
