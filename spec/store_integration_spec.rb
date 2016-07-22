require('spec_helper')

# describe('stores') do
#
#   describe('app homepage', {:type => :feature}) do
#     it('displays the homepage') do
#       visit('/')
#       expect(page).to have_content('Store List')
#     end
#
#     it('contains no stores before any are saved') do
#       visit('/')
#       expect(page).not_to have_content 'Click a link to view store details'
#     end
#
#     it('displays an Add Store link') do
#       visit('/')
#       expect(page).to have_content 'Add a Store'
#     end
#
#     it('displays Add Store Page when Add Store link is clicked') do
#       visit('/')
#       click_link('Add a Store')
#       expect(page).to have_content('Add Store Page')
#     end
#
#     it('displays stores that have been saved') do
#       visit('/')
#       click_link('Add a Store')
#       fill_in('store', :with => "Joan's shoes")
#       click_button('Add')
#       expect(page).to have_content("Joan's shoes")
#     end
#
#     it('displays Store Detail Page when store link is clicked') do
#       visit('/stores/new')
#       fill_in('store', :with => "Joan's shoes")
#       click_button('Add')
#       click_link("Joan's shoes")
#       expect(page).to have_content('Store Detail Page')
#     end
#   end
#
#   describe('Add Store Page', {:type => :feature}) do
#
#     it("let's user add a store") do
#       visit('/stores/new')
#       fill_in('store', :with => "Joan's shoes")
#       click_button('Add')
#       expect(page).to have_content("Joan's shoes")
#     end
#
#     it('displays homepage when home link is clicked') do
#       visit('/stores/new')
#       click_link('home')
#       expect(page).to have_css('h1', 'Store List')
#     end
#
#   end
#
# end
