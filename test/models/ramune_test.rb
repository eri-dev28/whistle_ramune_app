require "test_helper"

class RamuneTest < ActiveSupport::TestCase

  def setup
    # テストユーザーをセット
    @user = users(:one)
    # テスト用所持ラムネレコードを作成
    # modelsのramune.rbとuser.rbを関連付けするコードを書いたため使用できる
    # user_idを自動的に正しい値に設定される
    @ramune = @user.build_ramune(ramune_normal_girl: 2,             ramune_normal_boy: 3,
                                 ramune_melon_girl: 4,              ramune_melon_boy: 5,
                                 ramune_grape_girl: 6,              ramune_grape_boy: 7,
                                 ramune_yogurt_girl: 8,             ramune_yogurt_boy: 9,
                                 ramune_strawberry_ver1_girl: 10,   ramune_strawberry_ver1_boy: 11,
                                 ramune_mixedfruit_girl: 12,        ramune_mixedfruit_boy: 13,
                                 ramune_orange_girl: 14,            ramune_orange_boy: 15,
                                 ramune_cola_girl: 16,              ramune_cola_boy: 17,
                                 ramune_pancake_girl: 18,           ramune_pancake_boy: 19,
                                 ramune_bluesoda_girl: 20,          ramune_bluesoda_boy: 21,
                                 ramune_strawberry_ver2_girl: 22,   ramune_strawberry_ver2_boy: 23,
                                 ramune_pineapplecandy_girl: 24,    ramune_pineapplecandy_boy: 25,
                                 ramune_mixedjuice_girl: 26,        ramune_mixedjuice_boy: 27,
                                 ramune_goldencola_girl: 28,        ramune_goldencola_boy: 29,
                                 ramune_piratecola_girl: 30,        ramune_piratecola_boy: 31,
                                 ramune_phantomthiefcola_girl: 32,  ramune_phantomthiefcola_boy: 33,
                                 ramune_cuppyramune_girl: 34,       ramune_cuppyramune_boy: 35,
                                 ramune_whistlealiencola_girl: 36,  ramune_whistlealiencola_boy: 37,
                                 ramune_strawberry_ver3_girl: 38,   ramune_strawberry_ver3_boy: 39,
                                 ramune_parasitecola_girl: 40,      ramune_parasitecola_boy: 41,
                                 ramune_jumpingbattlecola_girl: 42, ramune_jumpingbattlecola_boy: 43,
                                 ramune_inthefuturecola_girl: 44,   ramune_inthefuturecola_boy: 45)
  end

  test "テスト用の所持ラムネが有効かテスト" do
    # valid?はエラーがない場合はtrueを返し、エラーが発生した場合はfalseを返す
    assert @ramune.valid?
  end

  test "user_idがない所持ラムネは存在しないことのテスト" do
    # テスト用所持ラムネレコードのuser_idをnilにする
    @ramune.user_id = nil
    # 所持ラムネがfalseを返すことの確認 user_idを消したらpresenceがfalseになる(ramune.rbで定義)
    assert_not @ramune.valid?
  end

  test "rramune_normal_girlがない所持ラムネは存在しないことのテスト" do
    # テスト用所持ラムネのcontentに空白を代入
    @ramune.ramune_normal_girl = " "
    # 所持ラムネが有効でないことの確認
    assert_not @ramune.valid?
  end
end
