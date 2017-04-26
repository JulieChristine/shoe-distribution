require("bundler/setup")
require('pry')
Bundler.require(:default)
# require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

post("/brands") do
  name_brand = params.fetch("new_brand").capitalize()
  if name_brand.length>0
    Brand.create({:name_brand => name_brand})
    redirect("/")
  else
    redirect("/")
  end
end

post("/stores") do
  name_store = params.fetch("name_store").capitalize()
  location = params.fetch("location").capitalize()
  if name_store.length>0
    Store.create({:name_store => name_store, :location => location})
    redirect("/")
  else
    redirect("/")
  end
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @stores = Store.all
  erb(:brand)
end

patch ('/add_stores/:id') do
  brand = Brand.find(params.fetch('id').to_i())
  stores_ids = params['store_ids']
  new_store = params.fetch('new_store').capitalize()
  new_store_location = params.fetch('new_store_location').capitalize()
  brand.addStore(stores_ids, new_store, new_store_location)
  redirect("/brands/#{brand_id}")
end

patch ("/update/brand/:id") do
  brand_id = params.fetch("id").to_i()
  name_brand = params.fetch("name_brand").capitalize()
  brand = Brand.find(params.fetch("id").to_i())
  brand.update({:name_brand => name_brand})
  redirect("/brands/#{brand_id}")
end

delete ("/brand/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete()
  redirect to("/")
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all
  @brand = @store.brands
  erb(:store)
end

patch ('/add_brands/:id') do
  store_id = params.fetch("id").to_i()
  store = Store.find(params.fetch('id').to_i())
  brand = Brand.find(params.fetch('brand_id').to_i)
  # assign_brand = params.fetch('name_brand').capitalize()
  BrandsStore.create({:brand => brand, :store => store})
  redirect("/stores/#{store_id}")
end

patch ("/update/store/:id") do
  store_id = params.fetch("id").to_i()
  name_store = params.fetch("name_store").capitalize()
  location = params.fetch("location").capitalize()
  store = Store.find(params.fetch('id').to_i())
  store.update({:name_store => name_store, :location => location})
  redirect("/stores/#{store_id}")
end

delete ('/delete/store/:id') do
  store = Store.find(params.fetch('id').to_i())
  store.delete()
  redirect("/")
end
