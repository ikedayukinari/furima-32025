require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  it "項目に適切に値が入っていれば購入できる" do
    expect(@item_purchase).to be_valid
  end

  it "postal_codeが空では購入できないこと" do
    @item_purchase.postal_code = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
  end

  it "postal_codeにハイフンがなければ購入できないこと" do
    @item_purchase.postal_code = "1111111"
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Postal code is invalid")
  end

  it "prefecture_idが空では購入できないこと" do
    @item_purchase.prefecture_id = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'prefectures_idが1だと購入できない' do
    @item_purchase.prefecture_id = 1
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "municipalityが空では購入できないこと" do
    @item_purchase.municipality = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Municipality can't be blank")
  end

  it "house_numberが空では購入できないこと" do
    @item_purchase.house_number = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
  end

  it "phone_numberが空では購入できないこと" do
    @item_purchase.phone_number = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberが12桁以上では購入できないこと" do
    @item_purchase.phone_number = "111111111111"
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
  end

  it "tokenが空では購入できないこと" do
    @item_purchase.token = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
  end
end
