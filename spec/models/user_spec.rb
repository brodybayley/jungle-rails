require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'creates a user' do 
      @user = User.create(first_name: 'Shaungel', last_name: 'Robin', email: 'shon25@gmail.com', password: "hello1", password_confirmation: "hello1")
    end
  end
end
