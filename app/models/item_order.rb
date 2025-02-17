class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :telephone_number,
                :region_id, :street_address, :building, :token

  with_options presence: true do
    validates :user_id, :item_id, :prefecture, :token, :street_address
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  
  def save
    order = Order.create(user_id:, item_id:)
    Sell.create(order_id: order.id, post_code:, prefecture:, building:, street_address:, region_id:, telephone_number:)
  end
end
