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

      if block_size > 5
        raise StandardError.new('The maximum bock size is 5 rooms.')
      elsif block_size < 2
        raise StandardError.new('The minimum block size is 2 rooms.')
      end

    end

    def calculate_cost
      duration = Integer(check_out- check_in)
       reservation_cost = duration * (RATE * RATE_DISCOUNT)
      return reservation_cost
    end



  end # end of block
end # end of module
