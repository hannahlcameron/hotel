require_relative "spec_helper.rb"

describe 'block' do
  describe 'initialize' do
    it 'instantiates the class properties as the correct class type' do
      input = {reservation_id: 1, block_size: 2, check_in: Date.new(2018, 7, 06), check_out: Date.new(2018, 7, 10)}
      @new_block = Hotel::Block.new(input)

      @new_block.reservation_id.must_be_kind_of Integer
      @new_block.block_size.must_be_kind_of Integer
      @new_block.check_in.must_be_kind_of Date
      @new_block.check_out.must_be_kind_of Date
      @new_block.reserved_rooms.must_be_kind_of Array
    end

    it 'raises an error if provided an invalid date range' do

      # the start and end dates are the same
      proc{
      @new_block = Hotel::Block({reservation_id: 1, block_size: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 25)})
      }.must_raise StandardError

      # the start date is after the end date
      proc{
      @new_block1 = Hotel::Block({reservation_id: 1, block_size: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 19)})
      }.must_raise StandardError
    end
  end # end of describe initialize

  describe 'calculate_cost' do
    it 'calculates cost based on block rate not reservation rate' do
      input = {reservation_id: 1, block_size: 2, check_in: Date.new(2018, 7, 06), check_out: Date.new(2018, 7, 10)}
      @new_block = Hotel::Block.new(input)

      @new_block.calculate_cost.must_equal 640
    end
  end

end # end of describe block
