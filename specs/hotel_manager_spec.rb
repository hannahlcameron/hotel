require_relative "spec_helper.rb"

describe 'HotelManager' do

  it 'can create a new instance of HotelManager' do
    new_hotel = Hotel::HotelManager.new
    new_hotel.must_be_instance_of Hotel::HotelManager
  end # end of can create new instance

  it 'contains a list of all 20 rooms' do
    new_hotel = Hotel::HotelManager.new
    new_hotel.room_list.length.must_equal 20
  end

  it 'contains an empty array of hotel reservations' do
    new_hotel = Hotel::HotelManager.new
    new_hotel.reservations.length.must_equal 0      
  end

end # end of describe HotelManager
