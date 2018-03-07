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

    def reservations_by_date(date)
      reservation_list = []
      @reservations.each do |reservation|
        if reservation.stay_date_list[0..-2].include?(date)
          reservation_list << reservation
        end
      end
      return reservation_list
    end

    def find_available_rooms(start_date, end_date)
      if start_date == end_date
        raise StandardError.new('The start date and the end date cannot be the same date.')
      elsif start_date > end_date
        raise StandardError.new('The end date cannot be before the start date.')
      end

      potential_dates = (start_date..(end_date - 1)).to_a
      conflicting_reservations = []

      potential_dates.each do |date|
        conflicting_reservations += reservations_by_date(date)
      end

      unavailable_rooms = []

      if conflicting_reservations.length > 0
        conflicting_reservations.each do |reservation|
          unavailable_rooms << reservation.room_id
          available_rooms = @room_list - unavailable_rooms
          return available_rooms
        end
      else
        available_rooms = @room_list
        return available_rooms
      end
    end


    def add_reservation(check_in_date, check_out_date)
      new_reservation = Hotel::Reservation.new({reservation_id: get_reservation_id, room_id: get_available_room, check_in: check_in_date, check_out: check_out_date})
      reservations << new_reservation
      return new_reservation
    end


  end # end of class
end # end of module
