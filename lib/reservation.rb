module Hotel
  class Reservation

        RATE = 200.00

    attr_accessor :reservation_id, :room_id, :check_in, :check_out

    def initialize(input)
      @reservation_id = input[:reservation_id]
      @room_id = input[:room_id]
      @check_in = input[:check_in]
      @check_out = input[:check_out]

      if check_in == check_out
        raise StandardError.new('The start date and the end date cannot be the same date.')
      elsif check_in > check_out
        raise StandardError.new('The end date cannot be before the start date.')
      end

    end

    def stay_date_list
      list_of_dates = (@check_in..@check_out).to_a
      list_of_dates = list_of_dates[0..-2]
      return list_of_dates
    end

    def calculate_cost
      duration = Integer(check_out- check_in)
       reservation_cost = duration * RATE
      return reservation_cost
    end

  end # end of class
end # end of module
