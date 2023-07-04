class RamunesController < ApplicationController
  # ユーザーのログインを確認する
  before_action :logged_in_user, only: [:new, :create, :edit, :update]

  # フエラムネ一覧の表示
  def new
    # ログインしているユーザーのラムネ一覧がある場合
    if Ramune.exists?(user_id: session[:user_id])
      # ログインしているユーザーのラムネ一覧を取得
      @ramune = Ramune.find_by(user_id: session[:user_id])
      # editアクションに移動(編集)
      render 'edit'
    # ログインしているユーザーのラムネ一覧がない場合
    else
      # 新しいオブジェクトを生成して@ramuneというインスタンス変数に代入
      # フエラムネ一覧を開いた時に実行される 新しいフエラムネ一覧用の箱を作ってるイメージ?
      @ramune = Ramune.new
    end
  end

  # 新規フエラムネ一覧の登録
  def create
    # 新しいオブジェクトを入力されたパラメーターで生成して@ramuneというインスタンス変数を作成
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
        flash[:danger] = '登録に失敗しました'
        # newアクションに遷移 登録画面に戻る
        render 'new'
      else
        flash[:danger] = 'ログインしてください'
        # newアクションに遷移 登録画面に戻る
        # ステータスコードを記入することでerbのエラーメッセージが表示できる
        render 'new', status: :unprocessable_entity
        end
    end
  end

  # 既にデータベースにある人のフエラムネ一覧の編集
  def edit
  end

  # 既にデータベースにある人のフエラムネ一覧の更新
  def update
    # ログインしているユーザーのラムネ一覧を取得
    @ramune = Ramune.find_by(user_id: session[:user_id])
    # ラムネ一覧の更新が成功した場合
    if @ramune.update(ramune_params)
      # @ramuneをリロードする
      @ramune.reload
      # フラッシュメッセージの表示
      flash[:success] = "更新が完了しました"
      # ラムネ一覧ページを表示
      redirect_to ramunelist_url
    # ラムネ一覧が更新できなかった場合
    else
      # ラムネ一覧の更新に失敗した場合ラムネ一覧編集ページを再表示する
      flash[:danger] = '失敗しました'
      render 'edit', status: :unprocessable_entity
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
                    :ramune_melon_girl,             :ramune_melon_boy,
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