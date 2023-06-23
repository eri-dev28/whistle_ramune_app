class Ramune < ApplicationRecord
  # フエラムネテーブルがユーザーに所属する(belongs_to)関連付け
  belongs_to :user
  # データベースに保存される前にデータが正しいことの確認をすることをバリテーションという
  # user_idが空白でないことの確認
  validates :user_id, presence: true
  # 各項目に半角数値のみ入力できる制約を設定する
  with_options format: { with:/\A[0-9]+\z/, message: "半角数値で入力してください" } do
    validates :ramune_normal_girl
    validates :ramune_normal_boy
    validates :ramune_melon_girl
    validates :ramune_melon_boy
    validates :ramune_grape_girl
    validates :ramune_grape_boy
    validates :ramune_yogurt_girl
    validates :ramune_yogurt_boy
    validates :ramune_strawberry_ver1_girl
    validates :ramune_strawberry_ver1_boy
    validates :ramune_mixedfruit_girl
    validates :ramune_mixedfruit_boy
    validates :ramune_orange_girl
    validates :ramune_orange_boy
    validates :ramune_cola_girl
    validates :ramune_cola_boy
    validates :ramune_pancake_girl
    validates :ramune_pancake_boy
    validates :ramune_bluesoda_girl
    validates :ramune_bluesoda_boy
    validates :ramune_strawberry_ver2_girl
    validates :ramune_strawberry_ver2_boy
    validates :ramune_pineapplecandy_girl
    validates :ramune_pineapplecandy_boy
    validates :ramune_mixedjuice_girl
    validates :ramune_mixedjuice_boy
    validates :ramune_goldencola_girl
    validates :ramune_goldencola_boy
    validates :ramune_piratecola_girl
    validates :ramune_piratecola_boy
    validates :ramune_phantomthiefcola_girl
    validates :ramune_phantomthiefcola_boy
    validates :ramune_cuppyramune_girl
    validates :ramune_cuppyramune_boy
    validates :ramune_whistlealiencola_girl
    validates :ramune_whistlealiencola_boy
    validates :ramune_strawberry_ver3_girl
    validates :ramune_strawberry_ver3_boy
    validates :ramune_parasitecola_girl
    validates :ramune_parasitecola_boy
    validates :ramune_jumpingbattlecola_girl
    validates :ramune_jumpingbattlecola_boy
    validates :ramune_inthefuturecola_girl
    validates :ramune_inthefuturecola_boy
  end
end
