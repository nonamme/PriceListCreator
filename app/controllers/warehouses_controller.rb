class WarehousesController < ApplicationController
  def delete
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy

    redirect_to root_path
  end
end
