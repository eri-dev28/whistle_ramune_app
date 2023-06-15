require "test_helper"

# ActiveSupport::TestCaseクラスを継承しているUserTestクラスを作成
class UserTest < ActiveSupport::TestCase

  # テストデータの作成
  def setup
    # 有効なユーザー情報を@userに代入
    @user = User.new(name: "Testtaro", password: "password", password_confirmation: "password")
  end

  test "作成したテストユーザーが有効かテスト" do
    # @userが有効なユーザーならtrueが返ってくる
    assert @user.valid?
  end

  test "nameが空欄のユーザーが無効なユーザーになるかテスト" do
    # @userのnameを空欄にする
    @user.name = ""
    # @userが通らないことの確認
    assert_not @user.valid?
  end

  test "nameが空白のユーザーが無効なユーザーになるかテスト" do
    # @userのnameを空白のみにする
    @user.name = "     "
    # @userが通らないことの確認
    assert_not @user.valid?
  end

  test "nameが50文字を超える場合無効なユーザーになるかテスト" do
    # nameにaを51文字代入
    @user.name = "a" * 51
    # @userが通らないことの確認
    assert_not @user.valid?
  end

  test "有効なnameで正しく登録されるかテスト" do
    # 有効なnameを4つ用意
    valid_name = %w[aaaaaa BBBBBB 333333 dE5dE5dE5]
    # nameを1つづつ確認していく
    valid_name.each do |valid_name|
      # @userのnameに代入
      @user.name = valid_name
      # @userの情報に誤りがないか確認 どのnameをテストしたか出力? 失敗した時だけ出力?
      # inspectはオブジェクトや配列を文字列で返してくれるメソッド
      assert @user.valid?, "#{valid_name.inspect} should be valid"
    end
  end

  test "無効なnameでテストが通らないことのテスト" do
    # 無効なnameを設定 半角スペースが入れられないので検証不可?
    invalid_name = %w[aB3_aB3 ddd+ おおおお かか_きき ８８８８ けけ　ここ]
    # nameを1つづつ確認していく
    invalid_name.each do |invalid_name|
      # @userのnameに代入
      @user.name = invalid_name
      # @userの情報が間違っていることの確認 どのnameをテストしたか出力? 失敗した時だけ出力?
      assert_not @user.valid?, "#{invalid_name.inspect} should be invalid"
    end
  end

  test "nameが同じものは登録ができないことのテスト" do
    # @userのコピーを作成しduplicate_userに代入
    duplicate_user = @user.dup
    # @userをデータベースに保存
    @user.save
    # duplicate_userが有効なユーザーでないことの確認
    assert_not duplicate_user.valid?
  end

  test "nameが小文字で保存されているかテスト" do
    # 大文字と小文字混合のnameを作成
    mixed_case_name = "aaBBccDD"
    # @userのnameに代入
    @user.name = mixed_case_name
    # @userをデータベースに保存
    @user.save
    # 作成したnameを小文字に戻したものとデータベースに保存したnameが同じことを確認
    # reloadでレコードを再取得している
    assert_equal mixed_case_name.downcase, @user.reload.name
  end

  test "パスワードを空白のみで設定できないことのテスト" do
    # @userのpasswordとpassword_confirmationを空白6文字で設定
    @user.password = @user.password_confirmation = " " * 6
    # @userが有効でないことの確認
    assert_not @user.valid?
  end

  test "パスワードの最小文字数のテスト" do
    # @userのpasswordとpassword_confirmationを5文字で設定
    @user.password = @user.password_confirmation = "a" * 5
    # @userが有効でないことの確認
    assert_not @user.valid?
  end

end
