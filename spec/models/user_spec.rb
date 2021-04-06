require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'creates a user' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
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

    it 'must contain a first name' do 
      @user = User.create(first_name: nil, last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
    end

    it 'must contain a last name' do 
      @user = User.create(first_name: 'Shaungel', last_name: nil, email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
    end
  end
end
