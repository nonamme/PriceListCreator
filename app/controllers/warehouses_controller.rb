class WarehousesController < ApplicationController
  def delete
    warehouse = Warehouse.find(params[:id])
    warehouse.destroy
    redirect_to root_path
  end

  def search
    Warehouse.where("product = '#{params[:product]}'").find_each do |warehouse|
      Area.where("warehouse_id = #{warehouse.id} and post_codes like '%#{params[:postcode]}%'").find_each do |area|
        PriceList.where("area_id = #{area.id} and number_of_pallets = #{params[:number_of_palette]}").find_each do |priceList|
          puts "Warehouse  #{warehouse} Area: #{area} PriceList #{priceList}"
          @warehouse = warehouse
          @area = area
          @priceList = priceList
          respond_to do |format|
            format.html do
              # redirect_to warehouse_search_path
              render "search"
            end
            format.json do
              render json: {
                  warehouse: warehouse,
                  area: area,
                  priceList: priceList
              }
            end
          end
        end
      end
    end
  end

  def pricing
    # @warehouse
    # render 'search'
  end
end
