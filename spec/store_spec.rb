require('spec_helper')

describe(Store) do
  it("validates presence of name") do
    result1 = Store.create({:name => ""}).valid?
    result2 = Store.create({:name => nil}).valid?
    expect(result1).to eq(false)
    expect(result2).to eq(false)
  end
end
