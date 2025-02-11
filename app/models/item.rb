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


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :num
  validates :num_id, numericality: { other_than: 1, message: "can't be blank"} 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }   

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" } 

end