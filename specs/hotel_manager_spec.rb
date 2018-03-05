require_relative "spec_helper.rb"

describe 'HotelManager' do
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
    @new_hotel.room_list.length.must_equal 20
    @new_hotel.reservations.must_be_kind_of Array
    @new_hotel.reservations.length.must_equal 0
  end

end # end of describe HotelManager
