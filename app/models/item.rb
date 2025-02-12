class Item < ApplicationRecord

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :num_id, presence: true
  validates :category_id, presence: true  
  validates :region_id, presence: true 
  validates :shipping_fee_id, presence: true 
  validates :state_id, presence: true 

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
   validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  belongs_to :user
  has_one_attached :image
  belongs_to :num
  belongs_to :category
  belongs_to :region
  belongs_to :shipping_fee
  belongs_to :state


  extend ActiveHash::Associations::ActiveRecordExtensions
 
  validates :num_id, numericality: { other_than: 1, message: "can't be blank"} 
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }   
  
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" } 

end