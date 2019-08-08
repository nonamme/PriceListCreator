Rails.application.routes.draw do
  get 'price_list/index', :to => "price_lists#index"
  get 'price_list/add_warehouse', :to => "price_lists#addWarehouse"
  get 'price_list/edit_warehouse', :to => "price_lists#editWarehouse" # edit warehouse require passing warehouse id to edit
end
