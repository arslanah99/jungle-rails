require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
  it "Should be true because everything is added" do
  user = User.new(email: "g@g.com", password: 'BigPP', password_confirmation: 'BigPP', firstname: 'BiggerPP', lastname: 'BiggestPP');
  expect(user.save).to eql true
    end
  it "validators return proper error message if the passwords dont match" do
    user = User.new(email: "g@g.com", password: 'BigPP', password_confirmation: 'BigPPsg', firstname: 'BiggerPP', lastname: 'BiggestPP');
    user.save
    expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  it "validators return proper message if the emails are case sensetive dont match" do
    user1 = User.new(email: "g@g.COM", password: 'BigPP', password_confirmation: 'BigPP', firstname: 'BiggerPP', lastname: 'BiggestPP');
    user2 = User.new(email: "G@G.com", password: 'BigPP', password_confirmation: 'BigPP', firstname: 'BiggerPP', lastname: 'BiggestPP');
    user1.save
    user2.save
    expect(user2.errors.full_messages).to include 'Email is invalid'
  end
  it "validators return proper message if the Email is not inputted." do
    user1 = User.new(email: nil, password: 'BigPP', password_confirmation: 'BigPP', firstname: 'BiggerPP', lastname: 'BiggestPP');
    user1.save
    expect(user1.errors.full_messages).to include "Email can't be blank"
end
  it "validators return proper message if the firstname is not inputted" do
    user1 = User.new(email: "g@g.COM", password: 'BigPP', password_confirmation: 'BigPP', firstname: nil, lastname: 'BiggestPP');
    user1.save
    expect(user1.errors.full_messages).to include 
end
  it "validators return proper message if the last name is not inputted" do
    user1 = User.new(email: "g@g.COM", password: 'BigPP', password_confirmation: 'BigPP', firstname: 'biggerPP', lastname: nil);
    user1.valid?
    expect(user1.errors.full_messages).to include
end
  it "validators return proper message if password length dont make sense G" do
    user1 = User.new(email: "g@g.COM", password: 'Bi', password_confirmation: 'Bi', firstname: nil, lastname: 'BiggestPP');  
    user1.save
    expect(user1.errors.full_messages).to include 'Password is too short (minimum is 3 characters)'  
end
  describe '.authenicate_with_credentials' do
    it "validators return proper message if email has spaces before or after" do
    user2 = User.new(email: "g@g.com", password: 'gggg', password_confirmation: 'gggg', firstname: "BiggerPP", lastname: 'BiggestPP');  
    user2.save
    puts user2.errors.inspect
    user1 = User.authenticate_with_credentials("   g@g.com ", "gggg");  
      user1.save
      expect(user1.errors.full_messages).to include 'fdsa'
  end
end
end
end