class ArticlesController < ApplicationController
  def index
    articles = Article.paginate(page: params[:page])
    render json: serializer.new(articles), status: :ok
  end

  def show
    article = Article.find(params[:id])
    render json: serializer.new(article)
  end

  private

  def serializer
    ArticleSerializer
  end
end
