class User < ApplicationRecord
  # ユーザーがフエラムネのおまけ表を1つだけ所有する関連付け
  # dependent: :destroyはフエラムネのおまけ表は、その所有者(ユーザー)と一緒に破棄されることを保証している
  has_one :ramune, dependent: :destroy
  # ハッシュ化したパスワードをpassword_digestという属性に保存できる
  # 仮想的な属性のpasswordとpassword_confirmationが使えるようになる
  # authenticateメソッドが使えるようになる(passwordとpassword_confirmationが同じかどうか確認してくれる)
  has_secure_password

  # レコードが保存される前に名前を小文字に直す
  before_save { self.name = name.downcase }
  # 名前のフォーマット設定(半角アルファベットの大文字と小文字と数値のみ)
  VALID_NAME_REGEX = /\A[a-zA-Z0-9]+\z/
  # 名前の制約
  #  ・必須(presence)
  #  ・長さが最大50文字(length)
  #  ・半角アルファベットの大文字と小文字と数値のみ入力可(format)
  #  ・一意(uniqueness) case_sensitiveは大文字小文字を区別するかどうか
  validates :name, presence: true, length: { maximum: 50 },
                   format: { with: VALID_NAME_REGEX, message: "ユーザー名は半角アルファベットの大文字か小文字または数字のみで記入してください" },
                   uniqueness: { case_sensitive: false }
  # パスワードの制約
  # ・必須(presence)
  # ・長さが最小6文字(length)
  # allow_nil: trueは対象の値がnilの場合にバリデーションをスキップする
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end