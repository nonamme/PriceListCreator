Rails.application.routes.draw do
  root "price_lists#index"
  get 'price_list/index', :to => "price_lists#index"
  get 'price_list/add_warehouse', :to => "price_lists#addWarehouse", as: :add_warehouse
  post 'price_list/create_warehouse', :to => "price_lists#createWarehouse", as: :create_warehouse
  get 'price_list/edit_warehouse/:id', :to => "price_lists#editWarehouse", as: :edit_warehouse# edit warehouse require passing warehouse id to edit
  put 'price_list/update_warehouse/:id', :to => "price_lists#updateWarehouse", as: :update_warehouse

  delete 'warehouse/destroy/:id', :to => "warehouses#delete", as: :warehouse_destroy
  get 'warehouse/search', :to => "warehouses#search", as: :warehouse_search
end
