require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(id: 6, name: 'John', email: 'user@email.com', password: 'password',
                     password_confirmation: 'password')
  end

  it 'is valid if name is not nil' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is valid if email is not nil' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is valid if password is not nil' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end
