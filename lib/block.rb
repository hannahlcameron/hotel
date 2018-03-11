require 'date'
require 'pry'

module Hotel
  class Block < Reservation

    RATE = 175.00

    attr_accessor :block_size, :reserved_rooms

    def initialize(input)
      super

      @block_size = input[:block_size]
      @reserved_rooms = Array.new

    end

  end # end of block
end # end of module
