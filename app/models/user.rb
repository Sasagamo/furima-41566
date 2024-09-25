class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: /\A[^\x01-\x7E]+\z/}
  validates :name, presence: true, format: { with: /\A[^\x01-\x7E]+\z/}
  validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :birthdate, presence: true

end
