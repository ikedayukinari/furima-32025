class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do # with: の後の message: 正規表現にマッチしなかった時のエラー文はいらない？
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/

  # validate :password_complexity  #email,passwordのバリは元々設定されていて,その内容がconfig/initializers/deviseに載っている（触ることはないが）

  # def password_complexity
  # return if password.blank? || password =~ /\A[a-zA-Z0-9]+\z/ #この列でパスワードに半角英数字を指定
  # errors.add :password, "password is in valid"  #ここはエラーが出た時の画面の表示  "in valid"は値が無効っていう意味
  # end
end
# deviseのemailは @ が必須、メールアドレスが一意性というのは元々設定されている  確認用の２回入力も？
