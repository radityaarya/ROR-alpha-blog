class ArticlesController < ApplicationController
  before_action :set_article_with_params, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  # Show Certain Article by ID
  def show
  end

  # Show Form for New Input
  def new
    @article = Article.new
  end

  # Post / Create New Input
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "An article was succesfully creatad"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # Edit Article
  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "An article was succesfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "An article was succesfully deleted"
    redirect_to articles_path
  end


  private
    def set_article_with_params
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end
