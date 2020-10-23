describe "the process to add a new review" do
  it "adds a new review" do
    user = User.new(:email => 'email@gmail.com', :password => 'tacoCat', :admin => true)
    user.save
    product = Product.new({:name => "Blue Cheese", :cost => 2.54, :country_of_origin => "France"})
    product.save
    visit products_path
    click_on 'Blue Cheese'
    click_on 'Add a review'
    fill_in 'author', :with => 'Brian Harvey'
    fill_in 'content body', :with => 'This is some text which needs to be at least fifty characters in length. Yadda yadda yadda yadda yadda yadda.'
    select('3', from: 'Rating')
    click_on 'Create Review'
    expect(page).to have_content("New Review Created Successfully")
    expect(page).to have_content("Brian Harvey")
  end

  it "gives an error when no fields are entered" do
    user = User.new(:email => 'email@gmail.com', :password => 'tacoCat', :admin => true)
    user.save
    product = Product.new({:name => "Blue Cheese", :cost => 2.54, :country_of_origin => "France"})
    product.save
    visit products_path
    click_on 'Blue Cheese'
    click_on 'Add a review'
    expect(page).to have_content("There was an error while creating Review")
  end
end