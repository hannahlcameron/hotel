require 'date'
require 'pry'

module Hotel
  class HotelManager

    attr_reader :room_list
    attr_accessor :reservations

    def initialize
      @room_list = load_rooms
      @reservations = Array.new
      puts "A new hotel manager has been created."
    end

    def load_rooms
      room_list = Array(1..20)
      return room_list
    end

    def get_reservation_id

      if @reservations == []
        next_reservation_id = 1
        puts "The next reservation will be #{next_reservation_id}"
        return next_reservation_id
      else
        next_reservation_id = @reservations.length + 1
        puts "The next reservation will be #{next_reservation_id}"
        return next_reservation_id
      end
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

    def find_available_rooms(start_date, end_date)
      potential_dates = (start_date..(end_date - 1)).to_a
      unavailable_rooms = []
      @reservations.each do |reservation|
        date_check_list = reservation.stay_date_list
        checked_date_list = date_check_list - potential_dates
        if checked_date_list.length < date_check_list.length
          unavailable_rooms << reservation.room_id
        end
      end

      if unavailable_rooms.length == 20
        raise StandardError.new('There are no available rooms at this time.')
      elsif unavailable_rooms.length > 0
        available_rooms = @room_list - unavailable_rooms
        else
          available_rooms = @room_list
      end
      return available_rooms
    end

    def get_available_room(check_in_date, check_out_date)
      potential_rooms = find_available_rooms(check_in_date, check_out_date)
      next_room_id = potential_rooms.first
      puts "the next room id will be #{next_room_id}"
      return next_room_id
    end

    def add_reservation(check_in_date, check_out_date)
      new_reservation = Hotel::Reservation.new({reservation_id: get_reservation_id, room_id: get_available_room(check_in_date, check_out_date), check_in: check_in_date, check_out: check_out_date})
      @reservations.push(new_reservation)
      puts "the new reservation is #{new_reservation}."
      return new_reservation
    end
    
  end # end of class
end # end of module
