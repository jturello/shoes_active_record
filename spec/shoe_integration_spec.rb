require('spec_helper')

describe 'Add/List Shoe Brand Page', :type => :feature do
  it("let's users add a shoe brand") do
    visit '/'
    click_link 'Add a Shoe Brand'
    fill_in 'brand', :with => 'Nike Air Jordans'
    click_button 'Add'
    expect(page).to have_content 'Nike Air Jordans'
  end

end
