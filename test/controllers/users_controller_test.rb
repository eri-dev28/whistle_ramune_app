require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    # fixtureファイルのユーザーをセット
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "新規登録のパスが正しいかテスト" do
    # 新規登録のパスを取得
    get signup_path
    # 200番台?(成功)のレスポンスが帰ってくるか確認
    assert_response :success
  end

  test "ログインせずにユーザー情報編集ページにアクセスできないことのテスト" do
    # ユーザー編集ページにアクセス(ログインせず)
    get user_path
    # ログイン画面へ遷移しているか確認
    assert_redirected_to login_url
  end

  test "ログインせずにユーザー情報を編集しようとした時のテスト" do
    # ユーザー情報を変更するリクエスト(patch)
    patch user_path, params: { user: { name: @user_one.name } }
    # ログイン画面へ遷移しているか確認
    assert_redirected_to login_url
  end

  test "ログインしていないユーザーがユーザー削除リクエストを送っても削除されないかテスト" do
    # ユーザー数が変化していないことの確認
    assert_no_difference 'User.count' do
      # ユーザーを削除
      delete user_path
    end
    # レスポンスが正しいか確認? see_otherはリソースが別の場所にある
    assert_response :see_other
    # ログインページへ遷移しているか確認
    assert_redirected_to login_url
  end
end
