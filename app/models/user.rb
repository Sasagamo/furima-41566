class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname,      presence: true
  validates :surname,       presence: true,
                            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
  validates :name,          presence: true,
                            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
  validates :surname_kana,  presence:true,
                            format: { with: /\A[ァ-ヶー]+\z/ ,message:"is invalid. Input full-width katakana characters"}
  validates :name_kana,     presence: true,
                            format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :birthdate,     presence: true
end
