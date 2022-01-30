class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show], raise: false
  before_action :set_article, only: %i[ edit update destroy ]

  # before_action :protect_user, only: %i[ create edit update destroy ]



  # def search
  #   articles = Article.all
  #   if params[:title].present?
  #     articles = Article.where('title LIKE ?', "%#{params[:title]}%")
  #   else
  #     articles = Article.none
  #   end
  # end

  def index
    # すべての記事を表示
    articles = Article.all
    # すべてのタグを表示
    # @tag_list = Tag.all
    # 検索機能の実装
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    # ページネーションの実装
    @articles = articles.page(params[:page]).per(25)
  end

  def show
    # 選択された記事を表示
    @article = Article.find(params[:id])
    # 選択された記事のタグを表示
    # @articl_tags = @article.tags
  end

  def new
    @article = Article.new
    # @tag_list = Tag.all
  end

  def edit
    # @tag_list = @article.tags.pluck(:name).join(",")
  end

  def create
    # model からインスタンスを作成
    @article = current_user.articles.new(article_params)
    # タグの名前を参照
    # tag_list = params[:article][:tag_ids].split(nil)
    # インスタンスをdatabaseに保存
    if @article.save
      # @article.save_tag(tag_list)
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # tag_list = params[:article][:tag_ids].split(nil)
    if @article.update(article_params)
      # @article.save_tag(tag_list)
      redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
  end

  private
  # 作成、編集、削除の際は current_user.articles を使って制御する
  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, tag_ids:[])
  end


end
