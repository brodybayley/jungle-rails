require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'creates a product' do
      @category = Category.create(name: "plants")
      @product = Product.create(name: "shamrock", price: 2500, quantity: 10, category: @category)
    end

    it 'contains a name' do
      @category = Category.create(name: "plants")
      @product = Product.create(name: nil, price: 2500, quantity: 10, category: @category)
    end

    it 'contains a price' do
      @category = Category.create(name: "plants")
      @product = Product.create(name: "shamrock", price: nil, quantity: 10, category: @category)
    end

    it 'contains a quantity' do
      @category = Category.create(name: "plants")
      @product = Product.create(name: "shamrock", price: 2500, quantity: nil, category: @category)
    end

    it 'contains a category' do
      @category = Category.create(name: "plants")
      @product = Product.create(name: "shamrock", price: nil, quantity: 10, category: nil)
    end

  end
end
