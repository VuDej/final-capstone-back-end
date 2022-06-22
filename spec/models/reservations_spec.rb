require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @reservation = Reservation.new(pick_up_day: '2020-01-01', return_day: '2020-01-02', pick_up_city: 'New York')
  end

  it 'is valid if pick_up_day is not nil' do
    @reservation.pick_up_day = nil
    expect(@reservation).to_not be_valid
  end

  it 'is valid if return_day is not nil' do
    @reservation.return_day = nil
    expect(@reservation).to_not be_valid
  end

  it 'is valid if pick_up_city is not nil' do
    @reservation.pick_up_city = nil
    expect(@reservation).to_not be_valid
  end

  it 'is valid if return_city is nil' do
    @reservation.return_city = 'Houston'
    expect(@reservation).to_not be_valid
  end
end
