FactoryBot.define do # ここでFacoryBot(user_spec.rbへ)を使ってカラムの指定と、そのカラムに入れる値を設定している。
  factory :user do # ここの :user とuser_spec.rbのUserが同じやから互換性をもって使える。
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    first_name            { '幸生' }
    last_name             { '池田' }
    first_name_kana       { 'ユキナリ' }
    last_name_kana        { 'イケダ' }
    birthday              { Faker::Date.between(from: '1930-09-23', to: '2000-09-25') }
  end
end
