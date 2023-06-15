class ApplicationController < ActionController::Base

  # SessionsHelper(app/helpers/sessions_helper.rb)をすべてのページで使えるようにApplicationControllerで読み込みをする
  # (ApplicationControllerクラスを継承すると使用できる) heplerメソッドはデフォルトで全てのviewファイルから呼び出せる includeは読み込み
  include SessionsHelper

  def hello
    render html: "hello, world!"
  end

  # クラス内での呼び出しのみ可能 継承先のクラスでは呼び出せる
  private

    # application_controller.rbに追加することですべてのコントローラーで利用できる
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      # ユーザーがログインしていないことの確認 app/helpers/sessions_helper.rbで定義(ユーザーがログインしていればtrue、その他ならfalseを返す)
      unless logged_in?
        # ログイン画面に遷移する
        redirect_to login_url
      end
    end
end