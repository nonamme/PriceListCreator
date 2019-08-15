class Area < ApplicationRecord
  belongs_to :warehouse
  has_many :price_list, dependent: :destroy
end
