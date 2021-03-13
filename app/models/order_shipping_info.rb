class OrderShippingInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_num, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address
    validates :phone_num, format: {with: /\A\d{11}\z/}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingInfo.create(postal_code: postal_code,prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end


end