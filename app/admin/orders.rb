ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
actions :all, except: [:update, :destroy,:create,:new,:edit]
show do
    panel "Items " do
      table_for order.items do
        column :product_id 
        column :quantity 
        column :price
      end
    end
    active_admin_comments
end
remove_filter :items
filter :user, :collection => proc {(User.all).map{|c| [c.email, c.id]}}


end
