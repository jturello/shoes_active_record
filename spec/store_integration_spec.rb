require('spec_helper')

describe('stores', {:type => :feature}) do
  describe('app homepage', {:type => :feature}) do

    it('displays the homepage') do
      visit('/')
      expect(page).to have_content('Store List')
    end

    it('contains no stores before any are saved') do
      visit('/')
      expect(page).not_to have_content 'Click a link to view store details'
    end

    it('displays an Add Store link') do
      visit('/')
      expect(page).to have_content 'Add a Store'
    end

    it('displays Add Store Page when Add Store link is clicked') do
      visit('/')
      click_link('Add a Store')
      expect(page).to have_content('Add Store Page')
    end

    it('displays stores that have been saved') do
      visit('/')
      click_link('Add a Store')
      fill_in('add_store', :with => "Joan's shoes")
      click_button('Add')
      expect(page).to have_content("Joan's Shoes")
    end

    it('displays Store Detail Page when store link is clicked') do
      visit('/stores/new')
      fill_in('add_store', :with => "Joan's Shoes")
      click_button('Add')
      click_link("Joan's Shoes")
      expect(page).to have_content('Store Detail Page')
    end
  end

  describe('Add Store Page', {:type => :feature}) do

    it("let's user add a store") do
      visit('/stores/new')
      fill_in('add_store', :with => "Joan's shoes")
      click_button('Add')
      expect(page).to have_content("Joan's Shoes")
    end

    it('displays homepage when home link is clicked') do
      visit('/stores/new')
      click_link('home')
      expect(page).to have_css('h1', text: 'Store List')
    end

    it("let's user add a store location") do
      visit '/stores/new'
      fill_in 'add_store', :with => "Joan's shoes"
      fill_in 'add_location', :with => 'La Paz'
      click_button 'Add'
      click_link "Joan's Shoes"
      expect(page).to have_content 'La Paz'
    end

  end

  describe 'Store Detail Page', :type => :feature do

    it('displays store name') do
      visit('/stores/new')
      fill_in('add_store', :with => "Wanda's wonderful shoes")
      click_button('Add')
      click_link('Wanda\'s Wonderful Shoes')
      expect(page).to have_css('h3', text: "Wanda's Wonderful Shoes")
    end

    it('displays a home link') do
      visit '/stores/new'
      fill_in('add_store', :with => "Wanda's wonderful shoes")
      click_button('Add')
      click_link('Wanda\'s Wonderful Shoes')
      expect(page).to have_link 'home'
    end

    it('navigates to the home page when home link is clicked') do
      visit '/stores/new'
      fill_in('add_store', :with => "Wanda's wonderful shoes")
      click_button('Add')
      click_link('Wanda\'s Wonderful Shoes')
      click_link 'home'
      expect(page).to have_css('h1', text: 'Store List')
    end

    it "doesn't display the shoe brand list before any are saved" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s Wonderful Shoes'
      expect(page).not_to have_css 'h4', text: "Shoe Brand List"
    end

    it "displays an Add Shoe Brand link" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s Wonderful Shoes'
      expect(page).to have_link 'Add Shoe Brand'
    end

    it "displays Add Shoe Brand Page when user clicks add shoe brand link" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s Wonderful Shoes'
      click_link 'Add Shoe Brand'
      expect(page).to have_css 'h1', :text => 'Add Shoe Brand Page'
    end

    it "displays shoe brand in shoe brand list when added" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s Wonderful Shoes'
      click_link 'Add Shoe Brand'
      fill_in 'add_shoe', :with => 'Manolo Blahnik'
      click_button 'Add'
      expect(page).to have_css 'li', :text => 'Manolo Blahnik'
    end

    it("let's users update store info") do
      visit '/stores/new'
      fill_in 'add_store', :with => "Sam's snazzy shoes"
      fill_in 'add_location', :with => "New York"
      click_button 'Add'
      click_link "Sam's Snazzy Shoes"
      fill_in 'new_name', :with => "Sam's singularly snazzy shoes"
      fill_in 'new_location', :with => "New Rochelle"
      click_button 'Update'
      expect(page).to have_content "Sam's Singularly Snazzy Shoes"
      expect(page).to have_content "New Rochelle"
    end

    it("let's users delete the store") do
      visit '/stores/new'
      fill_in 'add_store', :with => "Sam's snazzy shoes"
      fill_in 'add_location', :with => "New York"
      click_button 'Add'
      click_link "Sam's Snazzy Shoes"
      click_button 'Delete'
      expect(page).to have_content('Store List')
      expect(page).not_to have_content "Sam's Snazzy Shoes"
    end
  end
end
