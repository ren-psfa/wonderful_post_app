class SumpleArticlesController < ApplicationController
  before_action :set_sumple_article, only: %i[ show edit update destroy ]

  # GET /sumple_articles or /sumple_articles.json
  def index
    @sumple_articles = SumpleArticle.all
  end

  # GET /sumple_articles/1 or /sumple_articles/1.json
  def show
  end

  # GET /sumple_articles/new
  def new
    @sumple_article = SumpleArticle.new
  end

  # GET /sumple_articles/1/edit
  def edit
  end

  # POST /sumple_articles or /sumple_articles.json
  def create
    @sumple_article = SumpleArticle.new(sumple_article_params)

    respond_to do |format|
      if @sumple_article.save
        format.html { redirect_to sumple_article_url(@sumple_article), notice: "Sumple article was successfully created." }
        format.json { render :show, status: :created, location: @sumple_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sumple_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sumple_articles/1 or /sumple_articles/1.json
  def update
    respond_to do |format|
      if @sumple_article.update(sumple_article_params)
        format.html { redirect_to sumple_article_url(@sumple_article), notice: "Sumple article was successfully updated." }
        format.json { render :show, status: :ok, location: @sumple_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sumple_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sumple_articles/1 or /sumple_articles/1.json
  def destroy
    @sumple_article.destroy

    respond_to do |format|
      format.html { redirect_to sumple_articles_url, notice: "Sumple article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sumple_article
      @sumple_article = SumpleArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sumple_article_params
      params.require(:sumple_article).permit(:title, :content)
    end
end
