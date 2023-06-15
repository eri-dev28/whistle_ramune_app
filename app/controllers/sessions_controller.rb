class SessionsController < ApplicationController

  # sessionを作成する?
  def new
  end

  # ログインページから送信された情報を受け取り、ログイン処理を行う
  def create
    # Userテーブルでnameで検索をかけユーザー情報を取得する
    user = User.find_by(name: params[:session][:name].downcase)
    # 上記で検索したユーザーのnameと入力されたpasswordが正しい場合
    # authenticateは引数に渡された文字列(パスワード)をハッシュ化した値と、データベース内にあるpassword_digestカラムの値を比較する
    if user && user.authenticate(params[:session][:password])
      # ログインする app/helpers/sessions_helper.rbで定義
      log_in user
      # ホーム画面に遷移
      #redirect_to root_url
    else
      # フラッシュメッセージを表示
      flash.now[:danger] = '正しいユーザー名または、パスワードを入力してください'
      # newアクションに移動
      render 'new'
    end
  end

  # ログアウトの処理
  def destroy
    # ログインしている場合はログアウトする app/helpers/sessions_helper.rbで両方定義
    log_out if logged_in?
    # ログイン画面に遷移
    redirect_to login_path
  end
end