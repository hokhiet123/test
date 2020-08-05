require 'rails_helper'

RSpec.describe User, type: :model do
  it 'first name invalid' do
    user = User.create(
      first_name: nil,
      last_name: "Test",
      email: "test@gmail.com", 
      password: '123456'
    )

    user.valid?
    expect(user.errors[:first_name]).to include ("can't be blank")
  end

  it 'last name invalid' do
    user = User.create(
      first_name: "Test",
      last_name: nil,
      email: "test@gmail.com", 
      password: '123456'
    )
    user.valid?
    expect(user.errors[:last_name]).to include ("can't be blank")
  end

  it 'first and last name invalid' do
    user = User.create(
      first_name: nil,
      last_name: nil,
      email: "test@gmail.com", 
      password: '123456'
    )
    user.valid?
    expect(user.errors[:first_name]&&user.errors[:last_name]).to include ("can't be blank")
  end

  it 'first and last name valid' do
    user = User.create(
      first_name: "Test",
      last_name: "Test",
      email: "test@gmail.com", 
      password: '123456'
    )
    user.valid?
    expect(user).to be_valid
  end

  it 'there are two emails co-exist' do
    user = User.create(
      first_name: "Test",
      last_name: "Test",
      email: "test@gmail.com", 
      password: '123456'
    )
    user1 = User.create(
      first_name: "Test1",
      last_name: "Test1",
      email: "test@gmail.com", 
      password: '123456'
    )
    user1.valid?
    expect(user1.errors[:email]).to include ("has already been taken")
  end

  it 'return full name' do
    user = User.create(
      first_name: "Test",
      last_name: "Test",
      email: "test@gmail.com", 
      password: '123456'
    )
    expect(user.name).to eq("Test Test")
  end

end
