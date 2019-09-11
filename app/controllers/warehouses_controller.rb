class WarehousesController < ApplicationController
  include WarehousesHelper

  def delete
    warehouse = Warehouse.find(params[:id])
    warehouse.destroy
    redirect_to root_path
  end

  def search
    @data = []
    @warehouses = []
    Warehouse.where("product = '#{params[:product]}'").find_each do |warehouse|
      Area.where("warehouse_id = #{warehouse.id} and post_codes like '%#{params[:postcode]}%'").find_each do |area|
        PriceList.where("area_id = #{area.id} and number_of_pallets = #{params[:number_of_palette]}").find_each do |priceList|
          puts "Warehouse  #{warehouse} Area: #{area} PriceList #{priceList}"
          @warehouses.push warehouse
          number_of_palettes = params[:number_of_palette]
          @data.push(getComputedData(priceList, warehouse, number_of_palettes))
        end
      end
    end
    respond_to do |format|
      respondHtml format
      respondJson format, { data: @data }
    end
  end

  def respondHtml(format)
    format.html do
      render "search"
    end
  end

  def respondJson(format, **data)
    format.json do
      render json: data
    end
  end

  def getComputedData(priceList, warehouse, number_of_palettes)
    calculator = Calculator.new(priceList: priceList, warehouse: warehouse, number_of_palettes: number_of_palettes)
    return {
        gross_price: calculator.grossPrice.round(2),
        gross_price_one_palette: calculator.grossPriceOnePalette.round(2),
        transport_for_client: calculator.transportForClient.round(2)
      }
  end
end

