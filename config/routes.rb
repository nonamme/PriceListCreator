Rails.application.routes.draw do
  root "price_lists#index"
  get 'price_list/index', :to => "price_lists#index"
  get 'price_list/add', :to => "price_lists#addWarehouse", as: :add_warehouse
  post 'price_list/create', :to => "price_lists#createWarehouse", as: :create_warehouse
  get 'price_list/edit/:id', :to => "price_lists#editWarehouse", as: :edit_warehouse # edit warehouse require passing warehouse id to edit
  put 'price_list/update/:id', :to => "price_lists#updateWarehouse", as: :update_warehouse

  get 'warehouse/destroy/:id', :to => "warehouses#delete", as: :warehouse_destroy
  get 'warehouse/search', :to => "warehouses#search", as: :warehouse_search
end
