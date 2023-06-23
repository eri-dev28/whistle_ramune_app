class ApplicationController < ActionController::Base

  # SessionsHelper(app/helpers/sessions_helper.rb)をすべてのページで使えるようにApplicationControllerで読み込みをする
  # (ApplicationControllerクラスを継承すると使用できる) heplerメソッドはデフォルトで全てのviewファイルから呼び出せる includeは読み込み
  include SessionsHelper

  # クラス内での呼び出しのみ可能 継承先のクラスでは呼び出せる
  private

    # application_controller.rbに追加することですべてのコントローラーで利用できる
    # ユーザーのログインを確認する
    def logged_in_user
      # ログインしていなかった場合
      unless logged_in?
        # アクセスしようとしたURLを保存する sessions_helper.rbで定義 フレンドリーフォワーディング
        store_location
        # ログインを促すフラッシュメッセージを出力
        # ログインページに遷移する ステータスコードは303 リソースが別の場所にあるに設定
        redirect_to login_url, status: :see_other
      end
    end

end