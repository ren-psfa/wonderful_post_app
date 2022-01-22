class MypageController < ApplicationController
skip_before_action :authenticate_user!, only: %i[ index show], raise: false
before_action :set_article, only: %i[edit update destroy]
  def index
    @articles = current_user.articles.all
  end


  private
  # 作成、編集、削除の際は current_user.articles を使って制御する
  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end


end
