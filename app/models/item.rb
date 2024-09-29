class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description,presence: true  

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
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                    format:{ with: /\A[0-9]+\z/}

end
