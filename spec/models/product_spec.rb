require 'rails_helper'

RSpec.describe Product, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
  context "Testing validation of Product Class" do
   let(:product) {build(:product)} 
    it "Validates the presence of title" do
        product.price=nil
     expect(product.save).to eq(false)
  end
  it "Validates the presence of price" do
    product.title=nil
 expect(product.save).to eq(false)
end
it "Sucess validation" do
  
expect(product.save).to eq(true)
end
end
context "Testing updation of Product Class" do
  let(:product) {build(:product)} 
  it "Sucessful updation" do
   # byebug
      product.update_attributes(:price => 1234)
      #byebug
   expect(product.price).to eq(1234)
end
end

end