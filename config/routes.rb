Rails.application.routes.draw do
  get 'price_list/index', :to => "price_lists#index"
  get 'price_list/add_warehouse', :to => "price_lists#addWarehouse"
end
