require 'pry'

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
      room_list = Array(1..20)
      return room_list
    end

    def get_reservation_id
      next_reservation_id = reservations.length + 1
      return next_reservation_id
    end

    def get_available_room
      next_room_id = room_list.sample
      # binding.pry
      return next_room_id
    end

    # def calculate_cost
    #
    #   return reservation_cost
    # end

    # def add_reservation(check_in_date, check_out_date)
    #   new_reservataion = Hotel::Reservation.new({reservation_id: get_reservation_id, room_id: get_available_room, check_in: check_in_date, check_out: check_out_date, cost: calculate_cost})
    # end



  end # end of class
end # end of module
