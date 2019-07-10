require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
    before do
        allow(controller).to receive(:authenticate_user!).and_return(true)
      end
context "Check response" do
it "check http response"do
get :index
    expect(response).to have_http_status(:success)
end
  it "check` rendering the template" do 
    get:index
     expect(response).to render_template :index
  end  
end
end
