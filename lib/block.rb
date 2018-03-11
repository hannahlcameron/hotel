require 'date'
require 'pry'

module Hotel
  class Block < Reservation

    RATE_DISCOUNT = 0.8

    attr_accessor :block_size, :reserved_rooms

    def initialize(input)
      super

      @block_size = input[:block_size]
      @reserved_rooms = Array.new

    end

    def calculate_cost
      duration = Integer(check_out- check_in)
       reservation_cost = duration * (RATE * RATE_DISCOUNT)
      return reservation_cost
    end

  end # end of block
end # end of module
