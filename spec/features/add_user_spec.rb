require 'rails_helper'

describe "#Users" do
  it "should allow a user to sign up" do
    visit new_user_registration_path
    fill_in "email", :with => "email@gmail.com"
    fill_in "password",  :with => "tacoCat"
    click_on "Sign up"
    expect(page).to have_content("You have signed up successfully")
  end
end