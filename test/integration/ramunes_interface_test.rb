#require "test_helper"
#
#class RamunesInterface < ActionDispatch::IntegrationTest
#
#  def setup
#    # テストユーザーを取得
#    #@user = users(:three)
#    @user = users(:three)
#    # テストユーザーでログイン
#    log_in_as(@user)
#  end
#end
##
##class RamunesInterface2 < RamunesInterface
##
##  def setup
##    super
##    post login_path, params: { session: { name:     @user.name,
##                                          password: 'password' } }
##  end
##end
#
## RamunesInterfaceクラスを継承したRamunesInterfaceTestを作成
#class RamunesInterfaceTest < RamunesInterface
#
#  test "ユーザーがログインしているか" do
#    #post signup_path, params: { user: { name:                  @user.name,
#    #                                    password:              'password',
#    #                                    password_confirmation: 'password' } }
#    #post login_path, params: { session: { name:    @user.name,
#    #                                      password: 'password' } }
#    #post :create, params: {
#    #  session: {
#    #    name: @user.name,
#    #    password: @user.password
#    #  }
#    #}
#    get ramunelist_path
#    assert @user.valid?
#    @user.valid?
#    #debugger
#    assert is_logged_in?
#  end
#
#  test "無効なラムネ一覧は投稿できず、エラーメッセージが表示されているかテスト" do
#    # ブロックの中での処理でラムネ一覧の数が変わらないことの確認
#    assert_no_difference 'Ramune.count' do
#      # 空白のラムネ一覧を投稿
#      post ramunelist_path, params: { ramune: { user_id: @user.id, 
#                                                ramune_normal_girl: "",            ramune_normal_boy: "",
#                                                ramune_melon_girl: "",             ramune_melon_boy: "",
#                                                ramune_grape_girl: "",             ramune_grape_boy: "",
#                                                ramune_yogurt_girl: "",            ramune_yogurt_boy: "",
#                                                ramune_strawberry_ver1_girl: "",   ramune_strawberry_ver1_boy: "",
#                                                ramune_mixedfruit_girl: "",        ramune_mixedfruit_boy: "",
#                                                ramune_orange_girl: "",            ramune_orange_boy: "",
#                                                ramune_cola_girl: "",              ramune_cola_boy: "",
#                                                ramune_pancake_girl: "",           ramune_pancake_boy: "",
#                                                ramune_bluesoda_girl: "",          ramune_bluesoda_boy: "",
#                                                ramune_strawberry_ver2_girl: "",   ramune_strawberry_ver2_boy: "",
#                                                ramune_pineapplecandy_girl: "",    ramune_pineapplecandy_boy: "",
#                                                ramune_mixedjuice_girl: "",        ramune_mixedjuice_boy: "",
#                                                ramune_goldencola_girl: "",        ramune_goldencola_boy: "",
#                                                ramune_piratecola_girl: "",        ramune_piratecola_boy: "",
#                                                ramune_phantomthiefcola_girl: "",  ramune_phantomthiefcola_boy: "",
#                                                ramune_cuppyramune_girl: "",       ramune_cuppyramune_boy: "",
#                                                ramune_whistlealiencola_girl: "",  ramune_whistlealiencola_boy: "",
#                                                ramune_strawberry_ver3_girl: "",   ramune_strawberry_ver3_boy: "",
#                                                ramune_parasitecola_girl: "",      ramune_parasitecola_boy: "",
#                                                ramune_jumpingbattlecola_girl: "", ramune_jumpingbattlecola_boy: "",
#                                                ramune_inthefuturecola_girl: "",   ramune_inthefuturecola_boy: ""
#                                                } }
#    end
#    # 422 処理できないエンティティが返ってくることの確認
#    assert_response :unprocessable_entity
#    #debugger
#    #assert_redirected_to ramunelist_url
#  end
#
#  test "有効なラムネ一覧を投稿したときのテスト" do
#    # ラムネ一覧を作成
#    ramune_normal_girl = 2
#    ramune_normal_boy = 3
#    ramune_melon_girl = 4
#    ramune_melon_boy = 5
#    ramune_grape_girl = 6
#    ramune_grape_boy = 7
#    ramune_yogurt_girl = 8
#    ramune_yogurt_boy = 9
#    ramune_strawberry_ver1_girl = 10
#    ramune_strawberry_ver1_boy = 11
#    ramune_mixedfruit_girl = 12
#    ramune_mixedfruit_boy = 13
#    ramune_orange_girl = 14
#    ramune_orange_boy = 15
#    ramune_cola_girl = 16
#    ramune_cola_boy = 17
#    ramune_pancake_girl = 18
#    ramune_pancake_boy = 19
#    ramune_bluesoda_girl = 20
#    ramune_bluesoda_boy = 21
#    ramune_strawberry_ver2_girl = 22
#    ramune_strawberry_ver2_boy = 23
#    ramune_pineapplecandy_girl = 24
#    ramune_pineapplecandy_boy = 25
#    ramune_mixedjuice_girl = 26
#    ramune_mixedjuice_boy = 27
#    ramune_goldencola_girl = 28
#    ramune_goldencola_boy = 29
#    ramune_piratecola_girl = 30
#    ramune_piratecola_boy = 31
#    ramune_phantomthiefcola_girl = 32
#    ramune_phantomthiefcola_boy = 33
#    ramune_cuppyramune_girl = 34
#    ramune_cuppyramune_boy = 35
#    ramune_whistlealiencola_girl = 36
#    ramune_whistlealiencola_boy = 37
#    ramune_strawberry_ver3_girl = 38
#    ramune_strawberry_ver3_boy = 39
#    ramune_parasitecola_girl = 40
#    ramune_parasitecola_boy = 41
#    ramune_jumpingbattlecola_girl = 42
#    ramune_jumpingbattlecola_boy = 43
#    ramune_inthefuturecola_girl = 44
#    ramune_inthefuturecola_boy = 45    
#    # ブロックの中での処理でラムネ一覧の数が1つ増えていることの確認
#    assert_difference 'Ramune.count', 1 do
#      # 有効なラムネ一覧を投稿
#      post ramunelist_path, params: { ramune: { ramune_normal_girl: ramune_normal_girl,                       ramune_normal_boy: ramune_normal_boy,
#                                                ramune_melon_girl: ramune_melon_girl,                         ramune_melon_boy: ramune_melon_boy,
#                                                ramune_grape_girl: ramune_grape_girl,                         ramune_grape_boy: ramune_grape_boy,
#                                                ramune_yogurt_girl: ramune_yogurt_girl,                       ramune_yogurt_boy: ramune_yogurt_boy,
#                                                ramune_strawberry_ver1_girl: ramune_strawberry_ver1_girl,     ramune_strawberry_ver1_boy: ramune_strawberry_ver1_boy,
#                                                ramune_mixedfruit_girl: ramune_mixedfruit_girl,               ramune_mixedfruit_boy: ramune_mixedfruit_boy,
#                                                ramune_orange_girl: ramune_orange_girl,                       ramune_orange_boy: ramune_orange_boy,
#                                                ramune_cola_girl: ramune_cola_girl,                           ramune_cola_boy: ramune_cola_boy,
#                                                ramune_pancake_girl: ramune_pancake_girl,                     ramune_pancake_boy: ramune_pancake_boy,
#                                                ramune_bluesoda_girl: ramune_bluesoda_girl,                   ramune_bluesoda_boy: ramune_bluesoda_boy,
#                                                ramune_strawberry_ver2_girl: ramune_strawberry_ver2_girl,     ramune_strawberry_ver2_boy: ramune_strawberry_ver2_boy,
#                                                ramune_pineapplecandy_girl: ramune_pineapplecandy_girl,       ramune_pineapplecandy_boy: ramune_pineapplecandy_boy,
#                                                ramune_mixedjuice_girl: ramune_mixedjuice_girl,               ramune_mixedjuice_boy: ramune_mixedjuice_boy,
#                                                ramune_goldencola_girl: ramune_goldencola_girl,               ramune_goldencola_boy: ramune_goldencola_boy,
#                                                ramune_piratecola_girl: ramune_piratecola_girl,               ramune_piratecola_boy: ramune_piratecola_boy,
#                                                ramune_phantomthiefcola_girl: ramune_phantomthiefcola_girl,   ramune_phantomthiefcola_boy: ramune_phantomthiefcola_boy,
#                                                ramune_cuppyramune_girl: ramune_cuppyramune_girl,             ramune_cuppyramune_boy: ramune_cuppyramune_boy,
#                                                ramune_whistlealiencola_girl: ramune_whistlealiencola_girl,   ramune_whistlealiencola_boy: ramune_whistlealiencola_boy,
#                                                ramune_strawberry_ver3_girl: ramune_strawberry_ver3_girl,     ramune_strawberry_ver3_boy: ramune_strawberry_ver3_boy,
#                                                ramune_parasitecola_girl: ramune_parasitecola_girl,           ramune_parasitecola_boy: ramune_parasitecola_boy,
#                                                ramune_jumpingbattlecola_girl: ramune_jumpingbattlecola_girl, ramune_jumpingbattlecola_boy: ramune_jumpingbattlecola_boy,
#                                                ramune_inthefuturecola_girl: ramune_inthefuturecola_girl,     ramune_inthefuturecola_boy: ramune_inthefuturecola_boy,
#                                                user_id: @user.id
#                                                } }
#      #ramunethree = Ramune.new(user_id: @user.id, ramune_normal_girl: ramune_normal_girl)
#      #ramunethree.save
#    #debugger
#    end
#    # ラムネ一覧画面に遷移するか確認
#    assert_redirected_to ramunelist_url
#    # 返ってきたページ?のbodyタグに投稿したラムネ一覧があるか確認
#    #assert_match ramune_normal_girl, response.input
#  end
#
#  test "ラムネ一覧が既にある場合は修正して保存されることのテスト" do
#    # ラムネ一覧を作成
#    ramune_normal_girl = 5
#    # ブロックの中での処理でラムネ一覧の数が変わらないことの確認
#    assert_no_difference 'Ramune.count' do
#      # 有効なラムネ一覧を投稿
#      patch ramunelist_path, params: { ramune: { user_id: @user.id, ramune_normal_girl: ramune_normal_girl } }
#    end
#    # ホーム画面に遷移するか確認
#    assert_redirected_to ramunelist_url
#  end
#
#  test "ラムネ一覧にある数とデータベースに保存してある数が同じか確認" do
#    # ラムネ一覧画面を取得
#    get ramunelist_path
#    # ラムネ一覧の数とデータベースに保存してある数が一致するか確認
#    assert_match "#{@user.ramune_normal_girl.to_i}", response.body.ramune_normal_girl
#  end
#end
#