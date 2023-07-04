class UsersController < ApplicationController
  # before_actionメソッドは、何かの処理が実行される直前に特定のメソッドを実行する仕組み
  # logged_in_userはapplication_controller.rbで定義
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

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
      # ログインする app/helpers/sessions_helper.rbで定義
      log_in @user
      # ラムネ一覧に遷移
      redirect_to ramunelist_url
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

  # ユーザー情報編集機能
  def edit
    @user = User.find_by(id: session[:user_id])
  end

    # ユーザー情報更新機能
  def update
    @user = User.find_by(id: session[:user_id])
    # アップデートが完了した場合
    if @user.update(user_params)
      # @userをリロードする
      @user.reload
      # フラッシュメッセージを表示
      flash[:success] = "更新が完了しました"
      # @userのページにリダイレクト user_url(@user)
      redirect_to user_path
    # アップデートができなかった場合
    else
      # ユーザー情報の更新に失敗した場合ユーザー情報編集ページを再表示する?
      render 'edit', status: :unprocessable_entity
    end
  end

  # ユーザーの削除
  def destroy
    # クリックしたユーザー情報を取得する
    @user = User.find_by(id: session[:user_id])
    # ユーザーを削除
    @user.destroy
    # フラッシュメッセージを表示
    flash[:success] = "アカウントを削除しました"
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

    # beforeフィルタ

    # 正しいユーザーかどうか確認
    def correct_user
      # ユーザー情報をデータベースから取得
      @user = User.find_by(id: session[:user_id])
      # ホーム画面へ遷移 ステータスコード(303:リソースが別の場所にある)
      # データベースから取得したユーザーとログイン時にカレントユーザー(取得したクッキーのユーザー?)を比べて同じでなかった場合
      redirect_to(login_url, status: :see_other) unless current_user?(@user)
    end
end
