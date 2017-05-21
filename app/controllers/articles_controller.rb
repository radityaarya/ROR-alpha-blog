class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "An article was succesfully creatad"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
