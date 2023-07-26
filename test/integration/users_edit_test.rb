require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "ユーザーの編集が失敗したときのテスト" do
    # テストユーザーでログイン
    log_in_as(@user)
    get user_path
    assert_template 'users/edit'
    # patchメソッドでPATCHリクエストを送っている PATCHは修正
    patch user_path, params: { user: { name:  "",
                                       password:              "foo",
                                       password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select "div.alert", "4個のエラーがあります。"
  end

  test "ユーザーの編集が成功したときのテスト" do
    # ユーザー情報編集ページを取得(アクセスするけど未ログインのためアクセスできない)
    get user_path
    # ユーザーが未ログインで閲覧していたページとセッションに保存されているページが同じか検証
    assert_equal session[:forwarding_url], user_url
    # テストユーザーでログイン
    log_in_as(@user)
    # session[:forwarding_url]がnilになったか確認(sessions_controller.rbのcreateでreset_sessionをしているため?)
    assert_nil session[:forwarding_url]
    # リダイレクト先が正しいか確認 ユーザー情報編集ページに戻る
    assert_redirected_to user_url
    # nameに編集後の名前を代入
    name  = "ramune"
    # ユーザー情報編集ページの各欄に入力(パスワード変更が不要な場合はパスワードを入力せず更新)
    patch user_path, params: { user: { name:  name,
                                       password:              "",
                                       password_confirmation: "" } }
    # フラッシュメッセージが出ないことの確認
    assert_not flash.empty?
    # リダイレクト先が正しいか確認
    assert_redirected_to user_url
    # データベースを再読み込みし、ユーザー情報を更新
    @user.reload
    # データベースの内容と変更内容が正しいか確認
    assert_equal name,  @user.name
  end
end