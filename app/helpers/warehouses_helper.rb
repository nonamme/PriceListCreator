module WarehousesHelper
  class Calculator
    PROFIT = 1.07
    TWENTY_FOUR_PALETTES = 24
    SIXTY_SIX_BAGS = 66
    NINE_SEVEN_FIVE_KG = 0.975

    attr_accessor :number_of_palettes, :priceList, :warehouse

    def initialize(**values)
      @number_of_palettes = values[:number_of_palettes].to_f
      @priceList = values[:priceList]
      @warehouse = values[:warehouse]
    end

    def grossPrice
      netPriceWithRabate * PROFIT
    end

    def grossPriceOnePalette
      grossPrice / number_of_palettes
    end

    def transportForClient
      grossPriceOnePalette - warehouse.warehouse_detail.gross_price.to_f
    end

    private
      def grossPalettePrice
        warehouse.warehouse_detail.gross_price.to_f * number_of_palettes
      end

      def nePalettePrice
        grossPalettePrice / PROFIT
      end

      def transportPerTone
        logisticsWithCharge / number_of_palettes
      end

      def paletteWithNetTransport
        nePalettePrice + logisticsWithCharge
      end

      def netPriceWithRabate
        paletteWithNetTransport - priceList.net_rabate.to_f
      end

      def netSale
        warehouse.warehouse_detail.gross_price.to_f / PROFIT
      end

      def transportOnePalette
        warehouse.warehouse_detail.sum_24_pal.to_f / TWENTY_FOUR_PALETTES
      end

      def netPurchaseSum
        warehouse.warehouse_detail.price_pellete_per_tone.to_f + transportOnePalette + warehouse.warehouse_detail.bag_price.to_f
      end

      def margin
        netPriceWithRabate - logisticsWithCharge - (netPurchaseSum * number_of_palettes)
      end

      def pelletePricePer975Kg
        warehouse.warehouse_detail.price_pellete_per_tone.to_f * NINE_SEVEN_FIVE_KG
      end

      def warehouseMargin
        netSale - netPurchaseSum
      end
      def bag15kg
        warehouse.warehouse_detail.gross_price.to_f / SIXTY_SIX_BAGS
      end
      def profitability
        warehouseMargin / netPurchaseSum
      end

      def logisticsWithCharge
        return logisticsWithChargeSixPalettes warehouse if number_of_palettes == 6
        logisticsWithChargeAll priceList, warehouse, number_of_palettes
      end

      def logisticsWithChargeSixPalettes(warehouse)
        logistics_with_charge_two_palettes = priceLogisticsWithChargeTwoPalettes warehouse
        logistics_with_charge_four_palettes = priceLogisticsWithChargeFourPalettes warehouse
        logistics_with_charge_two_palettes + logistics_with_charge_four_palettes
      end

      def logisticsWithChargeAll(priceList, warehouse, number_of_palettes)
        (priceList.net_logistic + warehouse.warehouse_detail.order_price) + (warehouse.warehouse_detail.palette_price * number_of_palettes)
      end

      def priceLogisticsWithChargeTwoPalettes(warehouse)
        priceList2palettes = getPriceListTwoPalettes warehouse
        (priceList2palettes.first.net_logistic + warehouse.warehouse_detail.order_price) + (warehouse.warehouse_detail.palette_price * 2)
      end

      def priceLogisticsWithChargeFourPalettes(warehouse)
        priceList4palettes = getPriceListFourPalettes warehouse
        (priceList4palettes.first.net_logistic + warehouse.warehouse_detail.order_price) + (warehouse.warehouse_detail.palette_price * 4)
      end

      def getPriceListTwoPalettes(warehouse)
        PriceList.where(:area_id => Area.where(:warehouse => warehouse), :number_of_pallets => 2)
      end

      def getPriceListFourPalettes(warehouse)
        PriceList.where(:area_id => Area.where(:warehouse => warehouse), :number_of_pallets => 4)
      end
  end
end
