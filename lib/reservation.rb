module Hotel
  class Reservation

        RATE = 200.00

    attr_accessor :reservation_id, :room_id, :check_in, :check_out

    def initialize(input)
      @reservation_id = input[:reservation_id]
      @room_id = input[:room_id]
      @check_in = input[:check_in]
      @check_out = input[:check_out]
    end

    def stay_date_list
      list_of_dates = (@check_in..@check_out).to_a
      return list_of_dates
    end

    def calculate_cost
      duration = Integer(check_out- check_in)
       reservation_cost = duration * RATE
      return reservation_cost
    end

  end # end of class
end # end of module
