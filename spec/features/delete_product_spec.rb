require 'rails_helper'

describe "the process to delete a product" do
  it "deletes a product" do
    user = User.new(:email => 'email@gmail.com', :password => 'tacoCat', :admin => true)
    login_as(user, :scope => :user)
    product = Product.new({:name => "Blue Cheese", :cost => 2.54, :country_of_origin => "France"})
    product.save
    visit products_path
    click_on 'Blue Cheese'
    click_on 'Delete product'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to_not have_content("Blue Cheese")
  end
end  