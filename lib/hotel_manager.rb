require 'date'
require 'pry'

module Hotel
  class HotelManager

    attr_reader :room_list
    attr_accessor :reservations

    def initialize
      @room_list = load_rooms
      @reservations = Array.new
      # puts "This is to check how often this is happening."
    end

    def load_rooms
      room_list = Array(1..20)
      return room_list
    end

    def get_reservation_id
      if @reservations == []
        next_reservation_id = 1
        return next_reservation_id
      else
        next_reservation_id = @reservations.length + 1
        return next_reservation_id
      end
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

      potential_dates = (start_date..(end_date - 1)).to_a

      conflicting_reservations = []

      potential_dates.each do |date|
        conflicting_reservations += reservations_by_date(date)
      end
      puts "*conflicting_reservations are #{conflicting_reservations}"
      unavailable_rooms = []

      if conflicting_reservations.length > 0
        conflicting_reservations.each do |reservation|
          unavailable_rooms << reservation.room_id
          available_rooms = @room_list - unavailable_rooms
          puts "**Since the following are conflicting_reservations #{conflicting_reservations}, the available_rooms list is #{available_rooms}"
          return available_rooms
        end
      else
        available_rooms = @room_list
        puts "**no conflicting_reservations, so available_rooms is #{available_rooms}"
        return available_rooms
      end
    end

    def get_available_room(check_in_date, check_out_date)
      potential_rooms = find_available_rooms(check_in_date, check_out_date)
      puts "There are now #{potential_rooms.length} rooms"
      if potential_rooms.length >= 1
        next_room_id = potential_rooms.first
        return next_room_id
      else
        raise StandardError.new('There are no available rooms at this time.')
      end
    end

    def add_reservation(check_in_date, check_out_date)
      new_reservation = Hotel::Reservation.new({reservation_id: get_reservation_id, room_id: get_available_room(check_in_date, check_out_date), check_in: check_in_date, check_out: check_out_date})
      @reservations.push(new_reservation)
      return new_reservation
    end


  end # end of class
end # end of module
