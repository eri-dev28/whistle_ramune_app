require "test_helper"

# ActionDispatch::IntegrationTestクラスを継承しているUsersSignupTestクラスを作成
class UsersSignupTest < ActionDispatch::IntegrationTest

  test "無効なユーザーの作成のテスト" do
    # ユーザー新規作成ページを取得
    get signup_path
    # データベースのユーザー数が変わらないことの確認
    assert_no_difference 'User.count' do
      # 無効なユーザーで新規登録する
      post signup_path, params: { user: { name:  "",
                                          password:              "foo",
                                          password_confirmation: "bar" } }
    end
    # 422 Unprocessable Entityが返ってくることの確認(処理できないエンティティ)
    assert_response :unprocessable_entity
    # ユーザー新規作成ページが表示されていることの確認 正しいレイアウトと描画か
    assert_template 'users/new'
    # エラーメッセージが表示されていることの確認
    assert_select "div.alert", "4個のエラーがあります。"
  end

  test "有効なアカウントの作成テスト" do
    # データベースのユーザー数が1つ増えることの確認
    assert_difference 'User.count', 1 do
      # 有効なユーザーで新規登録
      post signup_path, params: { user: { name:  "whistleramune",
                                          password:              "password",
                                          password_confirmation: "password" } }
    end
  end
end