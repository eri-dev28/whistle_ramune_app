class RamunesController < ApplicationController
  # ユーザーのログインを確認する
  before_action :logged_in_user, only: :create

  # トップページの表示
  def new
    # 新しいオブジェクトを生成して@ramuneというインスタンス変数に代入
    # トップページを開いた時に実行される 新しいトップページ用の箱を作ってるイメージ?
    @ramune = Ramune.new
  end

  # 新規フエラムネ一覧の登録
  def create
    # 新しいオブジェクトを入力されたパラメーターで生成して@ramuneというインスタンス変数を作成
    #@ramune = Ramune.new(ramune_params)
    #@ramune = current_user.ramunes.build(ramune_params)
    #@micropost.image.attach(params[:micropost][:image])
    #user_id = User.find_by(id: session[:user_id])
    #p ramune_params
    #@ramune = Ramune.new(ramune_params.merge(user_id: user_id))
    @ramune = Ramune.new(ramune_params)
    # データベースに保存できた場合
    if @ramune.save
      # フラッシュメッセージを表示
      flash[:info] = '登録が完了しました'
      redirect_to signup_url
    # データベースに保存できなかった場合
    else
      # ログインしている場合
      if logged_in?
        # newアクションに遷移 登録画面に戻る
        # ステータスコードを記入することでerbのエラーメッセージが表示できる
        render 'new'
      else
        flash[:danger] = 'ログインしてください'
        render 'new', status: :unprocessable_entity
        end
    end
  end


#
#  # ユーザー情報の表示
##  def show
#    # クリックしたユーザー情報を取得する
##    @user = User.find(params[:id])
##  end
#
#  # ユーザーの削除
#  def destroy
#    # クリックしたユーザー情報を取得する
#    user = User.find(params[:id])
#    # ユーザーを削除
#    user.destroy
#    # ユーザー新規作成画面に戻る
#    redirect_to signup_path
#  end
#
  private

    # パラメーターの制約
    def ramune_params
      # データベースに指定の情報しか渡せないようにする
      # paramsメソッドを使うと登録フォームから送られてきた情報を引き出せる
      # requireメソッドでデータのオブジェクト名を指定している
      # permitメソッドで渡した引数のみがデータベースに保存される
      params.permit(:user_id,
                    :ramune_normal_girl,            :ramune_normal_boy, 
                    :ramune_grape_girl,             :ramune_grape_boy, 
                    :ramune_yogurt_girl,            :ramune_yogurt_boy, 
                    :ramune_strawberry_ver1_girl,   :ramune_strawberry_ver1_boy, 
                    :ramune_mixedfruit_girl,        :ramune_mixedfruit_boy, 
                    :ramune_orange_girl,            :ramune_orange_boy, 
                    :ramune_cola_girl,              :ramune_cola_boy, 
                    :ramune_pancake_girl,           :ramune_pancake_boy, 
                    :ramune_bluesoda_girl,          :ramune_bluesoda_boy, 
                    :ramune_strawberry_ver2_girl,   :ramune_strawberry_ver2_boy, 
                    :ramune_pineapplecandy_girl,    :ramune_pineapplecandy_boy, 
                    :ramune_mixedjuice_girl,        :ramune_mixedjuice_boy, 
                    :ramune_goldencola_girl,        :ramune_goldencola_boy, 
                    :ramune_piratecola_girl,        :ramune_piratecola_boy, 
                    :ramune_phantomthiefcola_girl,  :ramune_phantomthiefcola_boy, 
                    :ramune_cuppyramune_girl,       :ramune_cuppyramune_boy, 
                    :ramune_whistlealiencola_girl,  :ramune_whistlealiencola_boy, 
                    :ramune_strawberry_ver3_girl,   :ramune_strawberry_ver3_boy, 
                    :ramune_parasitecola_girl,      :ramune_parasitecola_boy, 
                    :ramune_jumpingbattlecola_girl, :ramune_jumpingbattlecola_boy, 
                    :ramune_inthefuturecola_girl,   :ramune_inthefuturecola_boy)
    end
end