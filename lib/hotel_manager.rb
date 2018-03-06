require 'pry'
require 'date'

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
      return next_room_id
    end

    def calculate_duration_of_stay(check_in_date, check_out_date)
      duration = Integer(check_out_date - check_in_date)
      return duration
    end

    def calculate_cost(duration)
       reservation_cost = duration * RATE
      return reservation_cost
    end

    def add_reservation(check_in_date, check_out_date)
      duration = calculate_duration_of_stay(check_in_date, check_out_date)
      stay_cost = calculate_cost(duration)

      new_reservation = Hotel::Reservation.new({reservation_id: get_reservation_id, room_id: get_available_room, check_in: check_in_date, check_out: check_out_date, cost: stay_cost})
      reservations << new_reservation
      return new_reservation
    end



  end # end of class
end # end of module
