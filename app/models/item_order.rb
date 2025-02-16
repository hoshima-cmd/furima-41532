class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :card_information, :expiry, :code, :post_code, :prefecture, :telephone_number,
                :municipality_id, :street_address, :building, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture
    validates :token
    validates :street_address
  end
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }

  def save
    order = Order.create(user_id:, item_id:)
    Sell.create(order_id: order.id, post_code:, prefecture:, building:, street_address:, municipality_id:,
                   telephone_number:)
  end
end
