class OrderShippingAdress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :block
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid.' }
    validates :token
    validates :item_id
    validates :user_id

  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAdress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                          phone_number: phone_number, order_id: order.id)
  end
end
