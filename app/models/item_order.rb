class ItemOrder 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :card_information, :expiry, :code, :post_code, :prefecture, :telephone_number, :municipality_id, :street_address, :building, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture
    validates :token
    validates :street_address
  end
  validates :post_code, presence: true
  validates :municipality_id, presence: true
  validates :telephone_number, presence: true
end