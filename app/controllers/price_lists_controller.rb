class PriceListsController < ApplicationController
  def index
    @name = "Price List controller"
  end

  def addWarehouse
    @name = :warehouse
    render 'add_warehouse'
  end

  def editWarehouse
    render 'edit_warehouse'
  end
end
