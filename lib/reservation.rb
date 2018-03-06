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

    def stay_date_list
      list_of_dates = (@check_in..@check_out).to_a
      return list_of_dates
    end


  end # end of class
end # end of module
