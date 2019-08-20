Rails.application.routes.draw do
  root "price_lists#index"
  get 'price_list/index', :to => "price_lists#index"
  get 'price_list/add_warehouse', :to => "price_lists#addWarehouse"
  get 'price_list/edit_warehouse', :to => "price_lists#editWarehouse" # edit warehouse require passing warehouse id to edit

  delete 'warehouse/destroy/:id', :to => "warehouses#delete", as: :warehouse_destroy
  get 'warehouse/search', :to => "warehouses#search", as: :warehouse_search
  get 'warehouse/pricing', :to => "warehouses#pricing", as: :warehouse_pricing
end
