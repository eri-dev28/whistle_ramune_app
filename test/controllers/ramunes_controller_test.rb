require "test_helper"

class RamunesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # テストユーザーの所持ラムネをセット
    @ramune = ramunes(:one)
  end

  test "ログインしていないユーザーが所持ラムネを作成しても所持ラムネの数が変わらないことのテスト" do
    # 中の処理をした時に所持ラムネの数が変わらないことの確認
    assert_no_difference 'Ramune.count' do
      # 所持ラムネを作成
      post ramunelist_path, params: { ramune: { ramune_normal_girl: "2",             ramune_normal_boy: "3",
                                                ramune_melon_girl: "4",              ramune_melon_boy: "5",
                                                ramune_grape_girl: "6",              ramune_grape_boy: "7",
                                                ramune_yogurt_girl: "8",             ramune_yogurt_boy: "9",
                                                ramune_strawberry_ver1_girl: "10",   ramune_strawberry_ver1_boy: "11",
                                                ramune_mixedfruit_girl: "12",        ramune_mixedfruit_boy: "13",
                                                ramune_orange_girl: "14",            ramune_orange_boy: "15",
                                                ramune_cola_girl: "16",              ramune_cola_boy: "17",
                                                ramune_pancake_girl: "18",           ramune_pancake_boy: "19",
                                                ramune_bluesoda_girl: "20",          ramune_bluesoda_boy: "21",
                                                ramune_strawberry_ver2_girl: "22",   ramune_strawberry_ver2_boy: "23",
                                                ramune_pineapplecandy_girl: "24",    ramune_pineapplecandy_boy: "25",
                                                ramune_mixedjuice_girl: "26",        ramune_mixedjuice_boy: "27",
                                                ramune_goldencola_girl: "28",        ramune_goldencola_boy: "29",
                                                ramune_piratecola_girl: "30",        ramune_piratecola_boy: "31",
                                                ramune_phantomthiefcola_girl: "32",  ramune_phantomthiefcola_boy: "33",
                                                ramune_cuppyramune_girl: "34",       ramune_cuppyramune_boy: "35",
                                                ramune_whistlealiencola_girl: "36",  ramune_whistlealiencola_boy: "37",
                                                ramune_strawberry_ver3_girl: "38",   ramune_strawberry_ver3_boy: "39",
                                                ramune_parasitecola_girl: "40",      ramune_parasitecola_boy: "41",
                                                ramune_jumpingbattlecola_girl: "42", ramune_jumpingbattlecola_boy: "43",
                                                ramune_inthefuturecola_girl: "44",   ramune_inthefuturecola_boy: "45" } }
    end
    # ログインページに遷移しているか確認
    assert_redirected_to login_url
  end

  #test "ログインしていないユーザーが所持ラムネを削除しようとしても所持ラムネの数が変わらないことのテスト" do
  #  # 中の処理をした時に所持ラムネの数が変わらないことの確認
  #  assert_no_difference 'Ramune.count' do
  #    # テストユーザーの所持ラムネを削除
  #    delete ramunelist_path(@ramune)
  #  end
  #  # レスポンスが303 リソースが別の場所にあるのステータスコードを持っているか確認
  #  assert_response:see_other
  #  # ログインページに遷移しているか確認
  #  assert_redirected_to login_url
  #end

  #test "間違ったユーザーによる所持ラムネ削除のテスト" do
  #  # テストユーザーoneでログイン
  #  log_in_as(users(:one))
  #  # twoの所持ラムネを取得
  #  ramune = ramunes(:two)
  #  # 以下の処理で所持ラムネの数が変わらないことの確認
  #  assert_no_difference 'Ramune.count' do
  #    # 所持ラムネを削除
  #    delete ramunelist_path(ramune)
  #  end
  #  # ステータスコードを返すか確認 303
  #  assert_response:see_other
  #  # ホーム画面に遷移しているか確認
  #  assert_redirected_to root_url
  #end
end
