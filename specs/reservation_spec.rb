require_relative "spec_helper.rb"

describe 'reservation' do
  describe 'initialize' do
    before do
      @new_reservation = Hotel::Reservation.new({reservation_id: 1, room_id: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 27)})
    end

    it 'instantiates the class properties as the correct class type' do
      @new_reservation.reservation_id.must_be_kind_of Integer
      @new_reservation.room_id.must_be_kind_of Integer
      @new_reservation.check_in.must_be_kind_of Date
      @new_reservation.check_out.must_be_kind_of Date
    end

    it 'raises an error if provided an invalid date range' do

      # the start and end dates are the same
      proc{
      @new_reservation = Hotel::Reservation.new({reservation_id: 1, room_id: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 25)})
      }.must_raise StandardError

      # the start date is after the end date
      proc{
      @new_reservation1 = Hotel::Reservation.new({reservation_id: 1, room_id: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 19)})
      }.must_raise StandardError
    end

  end # end of initialize

  describe 'stay_date_list' do
    before do
      @new_reservation = Hotel::Reservation.new({reservation_id: 1, room_id: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 27)})
    end

    it 'returns a list of dates that are covered by a reservation' do
      date_list = @new_reservation.stay_date_list
      date_list.must_be_kind_of Array
      date_list[0].must_be_instance_of Date
      date_list.length.must_equal 3
    end

  end

  describe 'calculate_duration_of_stay' do
    before do
      @new_reservation = Hotel::Reservation.new({reservation_id: 1, room_id: 2, check_in: Date.new(2018, 5, 25), check_out: Date.new(2018, 5, 27)})
    end

    it 'returns a float of the correct cost' do
      cost = @new_reservation.calculate_cost
      cost.must_be_kind_of Float
      cost.must_equal 400.00
    end
  end # end of describe calculate_cost

end # end of describe Reservation
