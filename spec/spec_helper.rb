ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

RSpec.configure do |config|
  config.after(:each) do

    Store.all().each() do |store|
      store.shoes.clear
      store.destroy()
    end

    Shoe.all().each() do |brand|
      brand.stores.clear
      brand.destroy()
    end
  end
end
