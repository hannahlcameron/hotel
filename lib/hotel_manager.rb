require 'pry'
require 'date'

module Hotel
  class HotelManager

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

    def add_reservation(check_in_date, check_out_date)
      new_reservation = Hotel::Reservation.new({reservation_id: get_reservation_id, room_id: get_available_room, check_in: check_in_date, check_out: check_out_date})
      reservations << new_reservation
      return new_reservation
    end

    def reservations_by_date(date)
      reservation_list = []
      @reservations.each do |reservation|
        if reservation.stay_date_list.include?(date)
          reservation_list << reservation
        end
      end
      return reservation_list
    end

  end # end of class
end # end of module
