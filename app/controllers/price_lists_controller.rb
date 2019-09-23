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
        PriceList.create(
            :number_of_pallets => k,
            :net_rabate => v[:net_rabate],
            :net_logistic => v[:net_logistic],
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

    pp params

    area_params.each do |area|
      a = Area.where(warehouse: w).where(number: area[0][-1].to_i).first
      a.update post_codes: area.second[:post_codes] unless a.nil?
      
      if a.nil?
        createAreaIfNil(area, w) 
        return
      else

        a.price_list.each_with_index do |price_list, index|
          b = PriceList.where(id: price_list.id).where(area: a) 
          b.update net_rabate: area.second["#{index + 1}"][:net_rabate], net_logistic: area.second["#{index + 1}"][:net_logistic]
          createPriceListIfNil(area, index) if b.nil?
        end
      end
    end

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

    def createAreaIfNil(area, warehouse)
      a = Area.create :number => area[0][-1],
          :post_codes => area.second[:postcode],
          :warehouse => warehouse if a.nil?

      6.times do |price_list_index|
        PriceList.create number_of_pallets: price_list_index + 1, net_rabate: area.second["#{price_list_index + 1}"][:net_rabate], net_logistic: area.second["#{price_list_index + 1}"][:net_logistic], area: a
      end
      redirect_to root_path
    end

    def createPriceListIfNil(area, index)
      PriceList.create number: area[0][-1],
                       net_rabate: area.second["#{index + 1}"][:net_rabate],
                       net_logistic: area.second["#{index + 1}"][:net_logistic]
    end
end