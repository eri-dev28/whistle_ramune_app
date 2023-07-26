require "test_helper"

class UsersLogin < ActionDispatch::IntegrationTest

  # テストユーザーを定義
  def setup
    @user = users(:one)
  end
end

# UsersLoginクラスを継承するInvalidPasswordTestを定義
class InvalidPasswordTest < UsersLogin

  test "ログインパスがあっているかテスト" do
    # ログインパスを取得(routes.rbで定義しているもの?)
    get login_path
    # ログインパスが希望するパスとあっているかテスト(ログイン画面)
    assert_template 'sessions/new'
  end

  test "有効なユーザー名と無効なパスワードでログインしようとした時のテスト" do
    # ログインパスに有効なメールアドレスと無効なパスワードを入力
    post login_path, params: { session: { name:    @user.name,
                                          password: "invalid" } }
    # ログインできないことを確認(test_helper.rbで定義 ログインできた場合にはtrueを返すメソッド)
    assert_not is_logged_in?
    # ログイン画面が表示されているかのテスト
    assert_template 'sessions/new'
    # フラッシュメッセージが表示されているかの確認(empty?は入れ物は存在するが中身が空の場合trueを返す 入れ物自体がない場合はNoMethodErrorが発生する)
    assert_not flash.empty?
    # GETリクエストでホーム画面を表示(GETメソッドはWebサーバーに欲しいページのリクエストを送る その時に値を送る場合はURLの後ろにくっつけて送る)
    # GETメソッドは受け取る時に使う? パスワードなどを送れないからページを表示するのみの場合の時だけ使用?
    get signup_path
    # フラッシュメッセージが消えていることの確認
    assert flash.empty?
  end
end

# UsersLoginクラスを継承しているValidLoginクラスを作成
class ValidLogin < UsersLogin

  def setup
    # UsersLoginクラスのsetupメソッドで定義されている@userインスタンス変数が必要なため
    super
    # 有効なユーザー名と有効なパスワードでログインする
    # (POSTメソッドはWebサーバーに値を渡す時に見えないところ(HTTPリクエストのボディ部)にくっつけて送る URLは変わらない) POSTメソッドは送る時に使う?
    post login_path, params: { session: { name:    @user.name,
                                          password: 'password' } }
  end
end

# ValidLoginクラスを継承しているValidLoginTestクラスを作成
class ValidLoginTest < ValidLogin

  test "有効なログインのテスト" do
    # ログインできたことを確認(test_helper.rbで定義 ログインできた場合にはtrueを返すメソッド)
    assert is_logged_in?
    # ユーザーページに遷移したか確認
    assert_redirected_to ramunelist_url
  end

  test "ログイン後のリダイレクト" do
    # follow_redirect!メソッドは、POSTリクエストを送信した結果を見て、指定されたリダイレクト先に移動するメソッド
    # 今だとsessions_controller.rbのcreateで指定した?ユーザーページに移動する? 移動しているか確認? それとも上記のテストのユーザーページ?
    follow_redirect!
    # ユーザーページにアクセスしているか確認
    assert_template 'ramunes/edit'
    # ログインのリンクが0個なことの確認
    assert_select "a[href=?]", login_path, count: 0
    # ログアウトのリンクがあることの確認
    assert_select "a[href=?]", logout_path
    # 自分のユーザーページへのリンクがあることの確認
    assert_select "a[href=?]", user_path
  end
end

# minitestは、名前がTestで終わる全てのクラスをテストで実行するようになっている Testで終わらないクラスのテストは明示的に使わない限り実行されない
# setupメソッドしか持たないクラス名の末尾には、Testをつけるべきではない
# minitestのsetupメソッドは、名前の末尾がTestではないクラスの中にカプセル化し、そのクラスを実際のテストで継承するのがいい
# ValidLoginクラスを継承したLogoutクラスを作成
class Logout < ValidLogin

  def setup
    # ValidLoginクラスのsetupメソッドで定義されている@userインスタンス変数が必要なため
    super
    # ログアウトする(セッションの削除)
    delete logout_path
  end
end

# Logoutクラスを継承したLogoutTestクラスを作成
class LogoutTest < Logout

  test "ログアウト成功のテスト" do
    # ユーザーがログアウト状態なことの確認(test_helper.rbで定義 ログインできた場合にはtrueを返すメソッド)
    assert_not is_logged_in?
    # レスポンスが特定のステータスコードを持っているか確認(303:リソースが別の場所にある)
    assert_response :see_other
    # ログイン画面に遷移したか確認
    assert_redirected_to login_url
  end

  test "ログアウト後のリダイレクトのテスト" do
    # follow_redirect!メソッドは、POSTリクエストを送信した結果を見て、指定されたリダイレクト先に移動するメソッド
    follow_redirect!
    # サインインのリンクがあることの確認
    assert_select "a[href=?]", signup_path
    # ログアウトのリンクがないことの確認
    assert_select "a[href=?]", logout_path, count: 0
    # ユーザーページがないことの確認
    assert_select "a[href=?]", user_path,   count: 0
  end

  test "2つ目のウィンドウでログアウトするテスト" do
    # logout_pathへのdeleteリクエスト ログアウトする(セッションの削除)
    delete logout_path
    # リダイレクト先が正しいかチェック ホーム画面に遷移するか
    assert_redirected_to login_url
  end
end