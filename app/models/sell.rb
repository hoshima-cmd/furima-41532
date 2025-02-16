class Sell < ApplicationRecord
  belongs_to :order

  extend
  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
end
