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
  @sub_header_instructions = 'Shoe Brand List'
  @store = Store.find(params['id'].to_i)
  @shoes = @store.shoes
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

######################################################
get('/stores/:id/shoes/new') do
  @page_title = 'Add Shoe Brand Page'
  @store = Store.find(params['id'].to_i)
  erb(:shoe_form)
end

post('/stores/:id/shoes/new') do
  @store = Store.find params['id'].to_i
  @shoe_brand = params[:add_shoe]
  if (!@shoe_brand.nil?) && (@shoe_brand != "")
    @shoe = Shoe.create({:brand => @shoe_brand})
    @store.shoes.push @shoe
  else
    @err = 'shoe brand cannot be blank'
    redirect '/stores/#{@store.id}/shoes/new'
  end
  redirect("/stores/#{@store.id}")
end
#######################################################
