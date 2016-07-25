require('spec_helper')

describe(Shoe) do

  it("validates presence of brand") do
    result1 = Shoe.create({:brand => ""}).valid?
    result2 = Shoe.create({:brand => nil}).valid?
    expect(result1).to eq(false)
    expect(result2).to eq(false)
  end

  it('capitalizes brands users enter') do
    shoe = Shoe.create({:brand => "entered lower"})
    expect(shoe.brand).to eq 'Entered Lower'
  end

  it('allows a many to many relationship with stores') do
    shoe1 = Shoe.create({brand: 'brand1'})
    shoe2 = Shoe.create({brand: 'brand2'})
    store1 = Store.create({name: 'store1'})
    store2 = Store.create({name: 'store2'})
    shoe1.stores.push(store1)
    shoe1.stores.push(store2)
    shoe2.stores.push(store1)
    shoe2.stores.push(store2)

    expect(shoe1.stores).to eq([store1, store2])
    expect(shoe2.stores).to eq([store1, store2])
  end
end
