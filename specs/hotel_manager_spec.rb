require 'pry'
require_relative "spec_helper.rb"


describe 'HotelManager' do
  describe 'initialize' do
    before do
      @new_hotel = Hotel::HotelManager.new
    end
    it 'can create a new instance of HotelManager' do
      @new_hotel.must_be_instance_of Hotel::HotelManager
    end # end of can create new instance

    # it 'can call class properties when instantiated' do
    #   [room_list, reservations].each do |prop|
    #     @new_hotel.must_respond_to prop
    #   end
    # end

    it 'instantiates the properties correctly' do
      @new_hotel.room_list.must_be_kind_of Array
      @new_hotel.reservations.must_be_kind_of Array
      @new_hotel.reservations.length.must_equal 0
    end
  end # end of describe initialize

  describe 'load_rooms' do
    it 'correctly creates room_list array' do
      @new_hotel = Hotel::HotelManager.new
      @new_hotel.room_list.length.must_equal 20
    end
  end # end of describe load_rooms

  describe 'get_reservation_id' do
    it 'correctly generates the next reservation_id when no reservations' do
      @new_hotel = Hotel::HotelManager.new
      @new_hotel.reservations.length.must_equal 0
      @new_hotel.get_reservation_id.must_equal 1
    end
    it 'correctly generates the next reservation_id when reservations already exist' do
      @new_hotel = Hotel::HotelManager.new
      @new_hotel.reservations = [1, 2, 3]
      @new_hotel.reservations.length.must_equal 3
      @new_hotel.get_reservation_id.must_equal 4
    end
  end # end of describe 'get_reservation_id'

  describe 'get_available_room' do
    it 'must return an appropriate room id' do
      @new_hotel = Hotel::HotelManager.new
      room_id = @new_hotel.get_available_room
      room_id.must_be_kind_of Integer
      room_id.must_be :>, 0
      room_id.must_be :<, 21
    end
  end # end of get_available_room

  describe 'add_reservation' do
    it 'creates an instance of Reservation' do
      @new_hotel = Hotel::HotelManager.new

      @new_hotel.add_reservation(Date.new(2018, 3, 25), Date.new(2018, 3, 28)).must_be_instance_of Hotel::Reservation
    end

    it 'adds the reservation to array of reservations' do
      @new_hotel = Hotel::HotelManager.new
      @new_hotel.reservations.length.must_equal 0
      @new_hotel.add_reservation(Date.new(2018, 3, 25),   Date.new(2018, 3, 28))
      @new_hotel.reservations.length.must_equal 1
    end
  end # end of describe add_reservation

  describe 'reservations_by_date' do
    before do
      @overlap_date = Date.new(2018, 5, 26)
      @new_hotel = Hotel::HotelManager.new

      # Two should contain the overlap date
      @new_hotel.add_reservation(@overlap_date - 1, @overlap_date + 1)
      @new_hotel.add_reservation(@overlap_date - 5, @overlap_date + 3)

      # One should not
      @new_hotel.add_reservation(@overlap_date - 20, @overlap_date - 15)
    end

    it 'returns an array of reservations for a specific date' do
      reservation_list = @new_hotel.reservations_by_date(@overlap_date)
      reservation_list.must_be_instance_of Array
      reservation_list.length.must_equal 2
      reservation_list.each do |res|
        res.must_be_instance_of Hotel::Reservation
      end
    end

  end # end of describe reservations_by_date

  describe 'find_available_rooms' do
    before do
      @begin_date = Date.new(2018, 5, 26)
      @end_date = Date.new(2018, 5, 28)
      @new_hotel = Hotel::HotelManager.new
    end

    it 'returns correct size list when 1 overlapping date' do
      # one reservation should affect returned array
      @new_hotel.add_reservation(@begin_date - 2, @end_date + 3)
      @new_hotel.add_reservation(@begin_date + 45, @end_date + 47)
      @new_hotel.find_available_rooms(@begin_date, @end_date).length.must_equal 19
    end

    it 'returns correct size list when no overlapping dates' do
      # neither reservation should affect returned array
      @new_hotel.add_reservation(@begin_date - 20, @end_date - 15)
      @new_hotel.add_reservation(@begin_date + 45, @end_date + 47)
      @new_hotel.find_available_rooms(@begin_date, @end_date).length.must_equal 20
    end

  end # end of describe find_available_rooms

end # end of describe HotelManager



      # Two should contain the overlap date
      # @new_hotel.add_reservation(@begin_date - 1, @overlap_date + 1)
      # @new_hotel.add_reservation(@begin_date- 5, @end_date + 3)
      #
      # # One should not
      # @new_hotel.add_reservation(@begin_date - 20, @end_date - 15)

# check_in_date = Date.new(2018, 4, 15)
# check_out_date = Date.new(2018, 4, 24)
# @new_hotel.add_reservation(check_in_date, check_out_date)
