require_relative "spec_helper.rb"

describe 'reservation' do
  describe 'initialize' do
    it "can call class properties when instantiated" do
      new_reservataion = Hotel::Reservation.new
      [reservation_id, room_id, check_in, check_out].each do |prop|
        new_reservataion.must_respond_to prop
      end
    end

    it 'instantiates the class properties as the correct class type' do
      new_reservataion.reservation_id.must_be_kind_of Integer
      new_reservataion.room_id.must_be_kind_of Integer
      new_reservataion.check_in.must_be_kind_of Date
      new_reservataion.check_out.must_be_kind_of Date
    end
  end # end of initialize

end # end of describe Reservation
