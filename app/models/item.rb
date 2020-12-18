class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :comments
  has_one :order

  # 空の投稿を保存できないようにする
  validates :name, :introduction, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :ship_date_id, :price,
            :image, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :ship_date_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/i } # 半角数字のみか

  extend ActiveHash::Associations::ActiveRecordExtensions # プルダウンメニューアクティブハッシュ
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
