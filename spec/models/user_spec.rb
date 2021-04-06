require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'creates a user' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
      expect(@user).to be_valid
    end

    it 'email must be unique' do
      @user = User.new(first_name: 'Shuangel', last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
      @user = User.new(first_name: 'Braungel', last_name: 'Bayley', email: 'bron25@gmail.com', password: "123456", password_confirmation: "123456")
      expect(@user.errors.full_messages).to include("Email has already been taken")

    it 'must contain a first name' do 
      @user = User.create(first_name: nil, last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
      puts @product.errors.full_messages
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'must contain a password' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: nil, password_confirmation: "hello1")
    end

    it 'must contain a password confirmation' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: nil)
    end

    it 'must contain a matching password and password confirmation' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hola1")
    end

    it 'must contain an email' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: nil, password: "hello1", password_confirmation: "hello1")
    end


    it 'must contain a last name' do 
      @user = User.create(first_name: 'Shaungel', last_name: nil, email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
    end

    it 'must contain a password with a minimum length of 6 characters' do
      @user = User.create(first_name: nil, last_name: 'Robin', email: 'shon25@gmail.com', password: "hello", password_confirmation: "hello")
    end
  end
end
