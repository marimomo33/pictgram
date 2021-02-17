class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new             #favoriteクラスのインスタンスfavoriteを生成する
    favorite.user_id = current_user.id  #favorite~に現在ログインしているuserのidを保存する
    favorite.topic_id = params[:topic_id] #favorite.topic_idにparams[:topic_id]を保存する

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end

end

