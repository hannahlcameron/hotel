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
      # binding.pry
      room_id.must_be_kind_of Integer
      room_id.must_be :>, 0
      room_id.must_be :<, 21

    end
  end # end of get_available_room

end # end of describe HotelManager

# check_in_date = Date.new(2018, 4, 15)
# check_out_date = Date.new(2018, 4, 24)
# @new_hotel.add_reservation(check_in_date, check_out_date)
