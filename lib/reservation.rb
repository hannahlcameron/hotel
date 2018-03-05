module Hotel
  class Reservation

    attr_accessor :reservation_id, :room_id, :check_in, :check_out, :cost

    def initialize(input)
      @reservation_id = input[:reservation_id]
      @room_id = input[:room_id]
      @check_in = input[:check_in]
      @check_out = input[:check_out]
      @cost = input[:cost]
    end


  end # end of class
end # end of module
