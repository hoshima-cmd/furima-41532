class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id , presence: true  
  validates :state_id, presence: true
  validates :price, presence: true
  validates :shipping_fee_id, presence: true
  validates :region_id, presence: true  
  validates :num_id, presence: true
  
  def change
  end
end
