class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/ }
    validates :name
    validates :last_name,       format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ }
    validates :first_name,      format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ }
    validates :last_name_kana,  format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :first_name_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :birthday
  end

  has_many :comments
  has_many :items
  has_many :orders
end
