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
      expect(page).to have_content("Joan's shoes")
    end

    it('displays Store Detail Page when store link is clicked') do
      visit('/stores/new')
      fill_in('add_store', :with => "Joan's shoes")
      click_button('Add')
      click_link("Joan's shoes")
      expect(page).to have_content('Store Detail Page')
    end
  end

  describe('Add Store Page', {:type => :feature}) do

    it("let's user add a store") do
      visit('/stores/new')
      fill_in('add_store', :with => "Joan's shoes")
      click_button('Add')
      expect(page).to have_content("Joan's shoes")
    end

    it('displays homepage when home link is clicked') do
      visit('/stores/new')
      click_link('home')
      expect(page).to have_css('h1', text: 'Store List')
    end
  end

  describe 'Store Detail Page', :type => :feature do

    it('displays store name') do
      visit('/stores/new')
      fill_in('add_store', :with => "Wanda's wonderful shoes")
      click_button('Add')
      click_link('Wanda\'s wonderful shoes')
      expect(page).to have_css('h3', text: "Wanda's wonderful shoes")
    end

    it('displays a home link') do
      visit '/stores/new'
      fill_in('add_store', :with => "Wanda's wonderful shoes")
      click_button('Add')
      click_link('Wanda\'s wonderful shoes')
      expect(page).to have_link 'home'
    end

    it('navigates to the home page when home link is clicked') do
      visit '/stores/new'
      fill_in('add_store', :with => "Wanda's wonderful shoes")
      click_button('Add')
      click_link('Wanda\'s wonderful shoes')
      click_link 'home'
      expect(page).to have_css('h1', text: 'Store List')
    end

    it "doesn't display the shoe brand list before any are saved" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s wonderful shoes'
      expect(page).not_to have_css 'h4', text: "Shoe Brand List"
    end

    it "displays an Add Shoe Brand link" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s wonderful shoes'
      expect(page).to have_link 'Add Shoe Brand' #, :href => '/stores/1/shoes/new'
    end

    it "displays Add Shoe Brand Page when user clicks add shoe brand link" do
      visit '/stores/new'
      fill_in 'add_store', :with => "Wanda's wonderful shoes"
      click_button 'Add'
      click_link 'Wanda\'s wonderful shoes'
      click_link 'Add Shoe Brand'
      expect(page).to have_css 'h1', :text => 'Add Shoe Brand Page'
    end

    it "displays shoe brand in shoe brand list when added" do
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

    # it("re-displays Store Detail Page on adding a new shoe brand") do
    #   visit '/stores/new'
    #   fill_in 'add_store', :with => "Wanda's wonderful shoes"
    #   click_button 'Add'
    #   click_link 'Wanda\'s wonderful shoes'
    #   click_link 'Add Shoe Brand', :href => '/shoes/new'
    #   fill_in 'add_shoe_brand', :with => 'Manolo Blahniks'
    #   expect(page).to have_content 'Manolo Blahniks'
    # end

    # it("let's users add a shoe brand") do
    #   visit '/stores/new'
    #   fill_in 'store', :with => "Wanda's wonderful shoes"
    #   click_button 'Add'
    #   click_link 'Wanda\'s wonderful shoes'
    #   fill_in 'add_shoe', :with => 'Manolo Blahniks'
    #   expect(page).to have_content 'Manolo Blahniks'
    # end

    # it("displays the shoe brand list once they are saved") do
    #   visit('/stores/new')
    #   fill_in('store', :with => "Wanda's wonderful shoes")
    #   click_button('Add')
    #   click_link('Wanda\'s wonderful shoes')
    #   expect(page).not_to have_css('h4', text: "Shoe Brand List")
    # end
  end
end
