class PriceListsController < ApplicationController
  def index
    @all_warehouses = Warehouse.all
  end

  def addWarehouse
    render 'add_warehouse'
  end

  def createWarehouse
    w = Warehouse.new(
        warehouse_name: params[:warehouse_name],
        supplier: params[:supplier_name],
        product: params[:product_name])
    wd = WarehouseDetail.create(
        gross_price: params[:gross_price],
        sum_24_pal: params[:transport_24_palettes],
        price_pellete_per_tone: params[:pellet_price_per_tone],
        bag_price: params[:bag_price],
        palette_price: params[:palette_charge],
        order_price: params[:order_charge],
        warehouse: w
    )

    w.save

    params[:areas].each do |area|
      a = Area.create(
          :number => area[0][-1],
          :post_codes => area[1][:postcode],
          warehouse: w)
      area[1].each do |k, v|
        p k
        # p v
        pl = PriceList.create(
            :number_of_pallets => k,
            :net_rabate => v[:rabate],
            :net_logistic => v[:logistic],
            :area => a
        ) unless k.eql? "postcode"
      end
    end

    redirect_to root_path
  end


  def editWarehouse

    render 'edit_warehouse'
  end
end
