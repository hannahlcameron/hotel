require_relative "spec_helper.rb"

describe 'block' do
  describe 'initialize' do
    before do
      input = {reservation_id: 1, block_size: 2, check_in: Date.new(2018, 7, 06), check_out: Date.new(2018, 7, 10)}
      @new_block = Hotel::Block.new(input)
    end
    it 'instantiates the class properties as the correct class type' do
      @new_block.reservation_id.must_be_kind_of Integer
      @new_block.block_size.must_be_kind_of Integer
      @new_block.check_in.must_be_kind_of Date
      @new_block.check_out.must_be_kind_of Date
      @new_block.reserved_rooms.must_be_kind_of Array
    end
  end # end of describe initialize

end # end of describe block
