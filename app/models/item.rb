class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  # ジャンルを選ぶ時のクリックする側
  belongs_to :category, :condition, :shipping_charge, :days_to_ship, :prefecture
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :days_to_ship_id
    validates :selling_price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :days_to_ship_id
    validates :prefectures_id
  end
end

# include ActiveHash::Associations  ジャンルの中身のモデルにつける？
# has_many :

# validates :prefectures_id, numericality: { other_than: 1 }