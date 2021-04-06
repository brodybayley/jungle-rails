require 'rails_helper'

RSpec.feature "Users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    first('article.product').find_button('Add').click()

    find_link('My Cart (1)').click()

    expect(find('header.page-header')).to have_content('My Cart')

    # VERIFY
    expect(page).to have_content("TOTAL:")

    # DEBUG
    save_screenshot
  end
end
