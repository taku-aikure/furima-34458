class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  with_options presence: true do
    validates :nickname
    validates :first_name,
      format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name,
      format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana,
      format: { with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_kana,
      format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
    validates :password,
      format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end

  has_many :items
  has_many :orders 
  
end
