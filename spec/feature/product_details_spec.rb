require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do
  
  #SETUO
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

scenario "They see all productdetails when button clicked" do
  visit root_path
  # within('.product') do
  # click_link 'Details'
  # end
  first('article.product').click_link('Details')

  sleep 3
  # save_screenshot
  expect(page).to have_css 'article.product'
end
end