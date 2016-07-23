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
  Store.create({:name => @store_name})
  redirect('/')
end

get('/stores/:id') do
  @page_title = 'Store Detail Page'
  @store = Store.find(params['id'].to_i)
  @shoes = @store.shoes
  erb(:store)
end

get('/shoes/new') do
  @page_title = 'Add Shoe Brand Page'

  erb(:shoe_form)
end
