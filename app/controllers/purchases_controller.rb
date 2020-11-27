class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params
  before_action :move_to_index
  
  def index
    @item_purchase = ItemPurchase.new #購入フォームへ遷移する
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
      if @item_purchase.valid?
        pay_item
        @item_purchase.save  #ここのsaveはitem_purchaseモデルの 「def save」の内容
        redirect_to root_path
      else
        render action: :index
      end
    
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_params
    @item = Item.find(params[:item_id]) #itemの情報を抜き出している
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.selling_price,  # 商品の値段 @item = Item.find(params[:item_id]) #itemモデルの情報から価格を抜き出している
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  
  
end
