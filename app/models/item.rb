class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :num
  belongs_to :category
  belongs_to :region
  belongs_to :shipping_fee
  belongs_to :state
  

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id , numericality: { other_than: 1, message: "can't be blank" }   
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :num_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :image, presence: true

end
