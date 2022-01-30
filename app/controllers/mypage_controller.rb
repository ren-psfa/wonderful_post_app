class MypageController < ApplicationController
skip_before_action :authenticate_user!, only: %i[ index show], raise: false
before_action :set_article, only: %i[edit update destroy]





  # def search
  #   articles = current_user.articles
  #   if params[:title].present?
  #     articles = articles.where('title LIKE ?', "%#{params[:title]}%")
  # end


  def index
    @articles = current_user.articles.all
    # @tag_list = Tag.all
    @articles = @articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = @articles.page(params[:page]).per(25)
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
