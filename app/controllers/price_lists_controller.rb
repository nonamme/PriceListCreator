class PriceListsController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def addWarehouse
    @name = :warehouse
    render 'add_warehouse'
  end

  def editWarehouse
    render 'edit_warehouse'
  end
end
