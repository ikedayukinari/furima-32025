# item_purchase はネストしている状態の名前
class ItemPurchase
  include ActiveModel::Model   # ↓ ここはゲッター、セッターを設定  アドレステーブルと購入テーブル
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do  # ここはアドレスのバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} #ハイフンが必要 123-4567みたいな形
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/} #ハイフン不要で11桁以内
    validates :token
  end

  def save  # 保存する内容
    purchase = Purchase.create(user_id: user_id, item_id: item_id) # ← userとitemの情報をcreateを使って、購入テーブルへ保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    # ↑ 購入者の情報をcreateを使って、addressテーブルへ保存 (purchase.idは上で定義したPurchase.createのidこと)
  end
end