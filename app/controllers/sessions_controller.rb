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
      # 転送先URLを取得(ユーザーがログイン前にアクセスしていたページ)
      forwarding_url = session[:forwarding_url]
      reset_session      # ログインの直前に必ずこれを書くこと 他の人が同じPCを使うときなどにログインした人のみ閲覧可能なページを見れてしまうため?
      # ログインする app/helpers/sessions_helper.rbで定義
      log_in user
      # forwarding_urlがある場合はそこにリダイレクトし、nilの場合はラムネ一覧画面に遷移
      redirect_to forwarding_url || ramunelist_url
    else
      # フラッシュメッセージを表示
      flash.now[:danger] = '正しいユーザー名または、パスワードを入力してください'
      # newアクションに移動(renderだとなぜかフラッシュメッセージが表示されないためredirect_toに変更)
      render 'new', status: :unprocessable_entity
      # ログイン画面に遷移
      #redirect_to login_path
    end
  end

  # ログアウトの処理
  def destroy
    # ログインしている場合はログアウトする app/helpers/sessions_helper.rbで両方定義
    log_out if logged_in?
    # ログイン画面に遷移
    redirect_to login_path, status: :see_other
  end
end