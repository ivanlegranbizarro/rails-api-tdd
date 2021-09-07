class ArticlesController < ApplicationController
  def index
    articles = Article.paginate(page: params[:page])
    render json: serializer.new(articles), status: :ok
  end

  private

  def serializer
    ArticleSerializer
  end
end
