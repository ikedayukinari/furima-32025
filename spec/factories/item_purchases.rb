FactoryBot.define do
  factory :item_purchase do
    postal_code           { '111-1111' }
    prefecture_id         { 2 }
    municipality          { "滋賀県" }
    house_number          { "あああ" }
    building_name         { "あああ" }
    phone_number          { "09011111111" }
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
