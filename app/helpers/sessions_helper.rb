module SessionsHelper

  # 渡されたユーザーでログインする userは引数 log_inメソッドを呼び出したところで定義している
  def log_in(user)
    # userのidをsessionのuser_idに代入
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す(いる場合)
  def current_user
    # sessionのuser_idがある場合
    if session[:user_id]
      # @current_userかUserテーブルにログインしようとしているユーザーが存在している場合@current_userにログインユーザーの情報を代入
      # @current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # 受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す userは引数 current_user?メソッドを呼び出したところで定義している
  # current_userは上記のメソッド名?
  def current_user?(user)
    user == current_user
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    # nil?は存在しない場合はtrueを返すためメソッド名の頭に!をつけることで結果を反転させている
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    # sessionのuser_idに関連した情報を削除する
    session.delete(:user_id)
    # @current_userにnilを代入する
    @current_user = nil
  end

  # アクセスしようとしたURLを保存する(フレンドリーフォワーディング)
  def store_location
    # session変数の:forwarding_urlキーに保存している
    # request.original_urlでリクエスト先が取得できる
    # if request.get?はGETリクエストが送られた時だけ実行する処理(ユーザーがセッション用のcookieを手動で削除してフォームから送信するケースなどがあるため
    #                                                                                                               ↑どういう動きか想像があまりつかない)
    #                                                           (POSTなどのリクエストを期待しているURLに対してリダイレクト経由でGETリクエストが送信されてしまうため
    #                                                                                                               ↑これはなんとなく分かる気がする)
    session[:forwarding_url] = request.original_url if request.get?
  end
end