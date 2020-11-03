require 'rails_helper'

describe "#Users" do
  it "should allow a user to sign up" do
    visit new_user_registration_path
    fill_in "Email", :with => "email@gmail.com"
    fill_in "Password",  :with => "tacoCat"
    fill_in "Password confirmation",  :with => 'tacoCat'
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully")
  end
end