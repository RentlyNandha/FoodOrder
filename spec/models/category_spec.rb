require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) {build(:category)} 
  context "Testing validation of Product Class" do
   
    it "Validates the presence of title" do
      category.title=nil
   expect(category.save).to eq(false)
  end
  it "Sucessfull validation " do
    
 expect(category.save).to eq(true)
end

  end
  context "Testing updation Class" do
  it "Update title" do
    category.update_attributes(:title => "update")
    category.save

  expect(category.title).to eq("update")
  end
  end
end
