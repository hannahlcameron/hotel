require_relative "spec_helper.rb"

describe 'reservation' do
  describe 'initialize' do
    before do
      @new_reservation = Hotel::Reservation.new({reservation_id: 1, room_id: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 27), cost: 400})
    end
    # it "can call class properties when instantiated" do
    #   [reservation_id, room_id, check_in, check_out].each do |prop|
    #     @new_reservataion.must_respond_to prop
    #   end
    # end

    it 'instantiates the class properties as the correct class type' do
      @new_reservation.reservation_id.must_be_kind_of Integer
      @new_reservation.room_id.must_be_kind_of Integer
      @new_reservation.check_in.must_be_kind_of Date
      @new_reservation.check_out.must_be_kind_of Date
      @new_reservation.cost.must_be_kind_of Integer
    end

  end # end of initialize

end # end of describe Reservation
