require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
    before do
        allow(controller).to receive(:authenticate_user!).and_return(true)

      end
    context "Check the http status" do
it "Get # index" do
get :index
expect(response).to have_http_status(:success)
end
end
end
