# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Warehouse.destroy_all
WarehouseDetail.destroy_all
Area.destroy_all
PriceList.destroy_all

warehouses = Warehouse.create([
 {
    warehouse_name: "Hof/Saale",
    product: "A1",
    supplier: "Krex - Szepietowo"
 }, {
    warehouse_name: "Hof/Saale",
    product: "A2",
    supplier: "Krex - Szepietowo"
 }, {
    warehouse_name: "Hof/Saale",
    product: "IBC",
    supplier: "Krex - Szepietowo"
 }])

warehouse_details = WarehouseDetail.create([
{
    gross_price: 209.0,
    sum_24_pal: 650.0,
    price_pellete_per_tone: 150.0,
    bag_price: 0.0,
    palette_price: 6.0,
    order_price: 6.50,
    warehouse: warehouses.first
}, {
   gross_price: 189.0,
   sum_24_pal: 950.0,
   price_pellete_per_tone: 135.0,
   bag_price: 0.0,
   palette_price: 6.0,
   order_price: 6.50,
   warehouse: warehouses[1]
},
{
    gross_price: 219.0,
    sum_24_pal: 770.0,
    price_pellete_per_tone: 150.0,
    bag_price: 0.0,
    palette_price: 5.0,
    order_price: 0.0,
    warehouse: warehouses[2]
}
])

areas = Area.create([
    {
     number: 1,
     post_codes: "95000;95001;95002",
     warehouse: warehouses.first
    },{
     number: 2,
     post_codes: "7000;7001;7002",
     warehouse: warehouses.first
    }
])

price_lists = PriceList.create([
{
    number_of_pallets: 1,
    net_rabate: 5.0,
    net_logistic: 48.20,
    area: areas.first
},
{
    number_of_pallets: 2,
    net_rabate: 10.0,
    net_logistic: 77.11,
    area: areas.first
},
{
    number_of_pallets: 3,
    net_rabate: 15.00,
    net_logistic: 109.24,
    area: areas.first
},
{
    number_of_pallets: 4,
    net_rabate: 20.00,
    net_logistic: 139.0,
    area: areas.first
},
{
    number_of_pallets: 5,
    net_rabate: 25.0,
    net_logistic: 166.01,
    area: areas.first
},
{
    number_of_pallets: 6,
    net_rabate: 30.0,
    net_logistic: 216.34,
    area: areas.first
},
])