require('spec_helper')

describe 'Add Shoe Brand Page', :type => :feature do

  it "let's users add a shoe brand" do
    visit '/stores/new'
    fill_in 'add_store', :with => "Wanda's wonderful shoes"
    click_button 'Add'
    click_link 'Wanda\'s wonderful shoes'
    click_link 'Add Shoe Brand'
    fill_in 'add_shoe', :with => 'Manolo Blahnik'
    click_button 'Add'
    expect(page).to have_css 'li', :text => 'Manolo Blahnik'
  end
end
