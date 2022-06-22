require 'rails_helper'

RSpec.describe Car, type: :model do
  before(:each) do
    @car = Car.new(price_per_day: 2000, description: 'This is a car', photo: 'photo.jpeg', car_type: 'jeep',
                   transmission: 'manual')
  end

  it 'is valid if car_model is nil' do
    @car.car_model = 'Toyota'
    expect(@car).to_not be_valid
  end

  it 'is valid' do
    @car.price_per_day = nil
    expect(@car).to_not be_valid
  end

  it 'is valid if description is not nil' do
    @car.description = nil
    expect(@car).to_not be_valid
  end

  it 'is valid if photo is not nil' do
    @car.photo = nil
    expect(@car).to_not be_valid
  end

  it 'is valid if car_type is not nil' do
    @car.car_type = nil
    expect(@car).to_not be_valid
  end

  it 'is valid if transmission is not nil' do
    @car.transmission = nil
    expect(@car).to_not be_valid
  end
end
