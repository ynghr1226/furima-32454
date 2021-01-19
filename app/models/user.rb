class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/ } # 半角英数字のみ
    validates :name

    with_options format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ } do # 全角のみ
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do # 全角カタカナのみ
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birthday
  end

  has_many :comments
  has_many :items
  has_many :orders
  has_many :likes

  def liked_by?(item_id)
    likes.where(item_id: item_id).exists?
  end

end
