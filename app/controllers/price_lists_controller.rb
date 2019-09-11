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
    @warehouse = Warehouse.find(params[:id])
    render 'edit_warehouse'
  end

  def updateWarehouse
    w = Warehouse.find(params[:id])
    w.update warehouse_params

    wd = WarehouseDetail.where(warehouse: w).first
    wd.update warehouse_details_params

    area_params.each do |area|
      a = Area.where(warehouse: w).where(number: area.first.to_i).first
      a.update post_codes: area.second[:post_codes] unless a.nil?
      a.price_list.each_with_index do |price_list, index|
        b = PriceList.find(price_list.id)
        b.update net_rabate: area.second["#{index + 1}"][:net_rabate], net_logistic: area.second["#{index + 1}"][:net_logistic]
      end unless a.nil?
    end unless area_params.nil?

    redirect_to root_path
  end

  private
    def warehouse_params
      params.require(:warehouse).permit(:supplier, :product, :warehouse_name)
    end

    def warehouse_details_params
      params.require(:warehouse_details).permit(:gross_price, :sum_24_pal, :price_pellete_per_tone, :bag_price, :palette_price, :order_price)
    end

    def area_params
      params.require(:areas).permit! unless params[:areas].nil?
    end
end
