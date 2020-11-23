require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # buildは.newと同じ
  end

  describe '商品出品' do
    context '出品ができるとき' do
      it '項目に適性に値が入っていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipping_charges_idが空だと登録できない' do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'shipping_charges_idが1だと登録できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges must be other than 1')
      end
      it 'prefectures_idが空だと登録できない' do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'prefectures_idが1だと登録できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'days_to_ship_idが空だと登録できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'selling_priceが空だと登録できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'selling_priceが299円以下だと登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it 'selling_priceが10000000円以上だと登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
      it 'selling_priceが全角数字だと登録できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it 'selling_priceが文字だと登録できない' do
        @item.selling_price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end
  end
end
# binding.pryを使ってここで@itemに値が入ってるか確かめた
