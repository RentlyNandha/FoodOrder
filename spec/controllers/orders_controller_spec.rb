require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(User.new)

  end
context "Check response" do
it "check http response"do
get :index
expect(response).to have_http_status(:success)
end
it "check rendering the template" do 
get :index
 expect(response).to render_template :index
end  
end
end