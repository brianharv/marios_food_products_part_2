require 'rails_helper'

describe "the process to add a new product" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => "Blue Cheese"
    fill_in 'Cost', :with => "2.54"
    fill_in 'Country of origin', :with => "France"
    click_on 'Create Product'
    expect(page).to have_content("New Product Created Successfully")
    expect(page).to have_content("Blue Cheese")
  end

  it "gives an error when no name is entered" do
    visit products_path
    click_on 'Create new product'
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end