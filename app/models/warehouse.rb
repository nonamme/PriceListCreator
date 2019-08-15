class Warehouse < ApplicationRecord
  has_one :warehouse_detail, dependent: :destroy
  has_many :area, dependent: :destroy
end
