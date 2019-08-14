class Warehouse < ApplicationRecord
  has_one :warehouse_detail
  has_many :area
end
