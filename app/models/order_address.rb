class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :phone_number, :postal_code, :prefecture_id, :city, :street_number, :building_name, :order_id,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number
  end
  validate :validate_phone_number

  def save
    order = Order.create(user_id:, item_id:)

    Address.create(phone_number:, postal_code:, prefecture_id:, city:,
                   street_number:, building_name:, order_id: order.id)
  end

  private

  def validate_phone_number
    return unless phone_number.present?

    unless phone_number.match?(/\A\d{10,11}\z/)
      if phone_number.length < 10
        errors.add(:phone_number, 'is too short')
      elsif phone_number.length > 11
        errors.add(:phone_number, 'is too long')
      end
    end

    return if phone_number.match?(/\A\d+\z/)

    errors.add(:phone_number, 'is invalid. Input only number.')
  end
end
