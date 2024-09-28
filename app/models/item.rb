class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_day
  belongs_to :prefecture

  with_options numericality: { other_than: 1 ,message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_payer_id
    validates :shipping_day_id
    validates :prefecture_id
  end
end
