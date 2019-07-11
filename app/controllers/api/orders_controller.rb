module Api
class OrdersController < ActionController::Base
    before_action :doorkeeper_authorize!
    def index
        user=User.find(doorkeeper_token.resource_owner_id)
        data =user.orders
        render json: {status: 'SUCCESS', message: 'Loaded orders', data:data}, status: :ok
    end
    def doorkeeper_unauthorized_render_options(error: nil)
        { json: { error: "Not authorized" } }
      end
end
end
