require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "パスのテスト?" do
    # ログインページを取得
    get login_path
    # 帰ってきたテストコードが200番台か確認?
    assert_response :success
  end
end