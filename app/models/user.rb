class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/ }

  validates :name,             presence: true
  validates :last_name,        presence: true
  validates :first_name,       presence: true
  validates :last_name_kana,   presence: true,
                               format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :first_name_kana,  presence: true,
                               format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :birthday,         presence: true

  has_many :comments
  has_many :items
  has_many :orders
end
