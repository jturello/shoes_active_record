require("bundler/setup")
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
  @store = Store.find(params['id'].to_i)
  @shoes = @store.shoes
  @sub_header_instructions = 'Shoe Brand List'
  erb(:store)
end

get('/stores/:id/shoes/new') do
  @page_title = 'Add Shoe Brand Page'
  @store = Store.find(params['id'].to_i)

  erb(:shoe_form)
end

post('/stores/:id/shoes/new') do
  @store = Store.find params['id'].to_i
  @shoe_brand = params[:add_shoe]
  @store.shoes.push Shoe.create({:brand => @shoe_brand})

  redirect("/stores/#{@store.id}")
end
