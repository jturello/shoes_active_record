require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @page_title = 'Store List'
  @stores = Store.all()
  @sub_header_instructions = 'Click a link to view store details'
  erb(:index)
end

get('/stores/new') do
    @page_title = 'Add Store Page'
    erb(:store_form)
end

post('/stores/new') do
  @store_name = params[:add_store]
  @store_location = params[:add_location]
  Store.create({name: @store_name, location: @store_location})
  redirect('/')
end

get('/stores/:id') do
  @page_title = 'Store Detail Page'
  @sub_header_instructions = 'Shoe Brand List'
  @store = Store.find(params['id'].to_i)
  @all_shoes = Shoe.all()
  erb(:store)
end

patch('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  new_name = params[:new_name]
  new_location = params[:new_location]
  @store.update({:name => new_name, :location => new_location})
  redirect("stores/#{@store.id}")
end

delete("/stores/:id") do
  @store = Store.find(params['id'].to_i)
  @store.shoes.clear
  @store.delete()
  redirect('/')
end

get('/shoes') do
  @page_title = 'Shoe Brand List Page'
  @sub_header_instructions = 'Shoe Brand List'
  @shoes = Shoe.all
  erb :shoes
end

post('/shoes/new') do
  brand = params[:brand]
  shoe = Shoe.create({:brand => brand})
  redirect '/shoes'
end

post('/stores/:id/brands') do
  @store = Store.find(params['id'].to_i)
  shoe = Shoe.find(params[:brand_id].to_i)
  @store.shoes.push(shoe)
  redirect "stores/#{@store.id}"
end
