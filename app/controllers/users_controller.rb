class UsersController < ApplicationController

  # ユーザー登録画面の表示
  def new
    # 新しいオブジェクトを生成して@userというインスタンス変数に代入
    # 新規登録の画面を開いた時に実行される 新しいユーザー用の箱を作ってるイメージ?
    @user = User.new
  end

  # 新規ユーザーの登録
  def create
    # 新しいオブジェクトを入力されたパラメーターで生成して@userというインスタンス変数を作成
    @user = User.new(user_params)
    # データベースに保存できた場合
    if @user.save
      # フラッシュメッセージを表示
      flash[:info] = "ようこそ"
      redirect_to root_url
    # データベースに保存できなかった場合
    else
      # newアクションに遷移 登録画面に戻る
      # ステータスコードを記入することでerbのエラーメッセージが表示できる
      render 'new', status: :unprocessable_entity
    end
  end

  # ユーザー情報の表示
#  def show
    # クリックしたユーザー情報を取得する
#    @user = User.find(params[:id])
#  end

  # ユーザーの削除
  def destroy
    # クリックしたユーザー情報を取得する
    user = User.find(params[:id])
    # ユーザーを削除
    user.destroy
    # ユーザー新規作成画面に戻る
    redirect_to signup_path
  end

  private

    # パラメーターの制約
    def user_params
      # データベースにユーザー名、パスワード、パスワード確認しか渡せないようにする
      # paramsメソッドを使うと新規登録フォームから送られてきた情報を引き出せる
      # requireメソッドでデータのオブジェクト名を指定している
      # permitメソッドで渡した引数のみがデータベースに保存される
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
