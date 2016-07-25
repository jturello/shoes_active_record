require('spec_helper')

describe(Store) do
  it("validates presence of name") do
    result1 = Store.create({:name => ""}).valid?
    result2 = Store.create({:name => nil}).valid?
    expect(result1).to eq(false)
    expect(result2).to eq(false)
  end

  it('allows a many to many relationship with shoes') do
    shoe1 = Shoe.create({brand: 'brand1'})
    shoe2 = Shoe.create({brand: 'brand2'})
    store1 = Store.create({name: 'store1'})
    store2 = Store.create({name: 'store2'})
    store1.shoes.push(shoe1)
    store1.shoes.push(shoe2)
    store2.shoes.push(shoe1)
    store2.shoes.push(shoe2)

    expect(store1.shoes).to eq([shoe1, shoe2])
    expect(store2.shoes).to eq([shoe1, shoe2])
  end
end
