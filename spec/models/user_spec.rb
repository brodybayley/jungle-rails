require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'creates a user' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      expect(@user).to be_valid
    end

    it 'emails must be unique' do
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      @user = User.create(first_name: 'Braungel', last_name: 'Bayley', email: 'shon25@gmail.com', password: '123456', password_confirmation: '123456')
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it 'must contain an email' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: nil, password: 'hello1', password_confirmation: 'hello1')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'must contain a first name' do 
      @user = User.create(first_name: nil, last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'must contain a last name' do 
      @user = User.create(first_name: 'Shaungel', last_name: nil, email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'must contain a password with a minimum length of 6 characters' do
      @user = User.create(first_name: nil, last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello', password_confirmation: 'hello')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'must contain a matching password and password confirmation' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hola1')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'must contain a password' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: nil, password_confirmation: 'hello1')
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'must contain a password confirmation' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  
  describe '.authenticate_with_credentials' do
    it 'logs in user' do
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      authenticate = User.authenticate_with_credentials(@user.email, @user.password)
      expect(authenticate).to_not be_nil
    end

    it 'should fail to log in user' do
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      authenticate = User.authenticate_with_credentials(@user.email, "hola123")
      expect(authenticate).to be_nil
    end

    it 'should ignore whitespace' do
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      authenticate = User.authenticate_with_credentials(' shon25@gmail.com ', @user.password)
      expect(authenticate).to_not be_nil
    end

    it 'should ignore case in email' do
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: 'hello1', password_confirmation: 'hello1')
      authenticate = User.authenticate_with_credentials('sHOn25@gmail.com', @user.password)
      expect(authenticate).to_not be_nil
    end
  end
end
