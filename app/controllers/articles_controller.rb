class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
    # redirect_to article_path
      flash[:notice] = "Article saved successfully!"
      # url = "/articles/#{@article.id}"
      redirect_to article_path(@article)
    else
      flash[:notice] = @article.errors.full_messages
      redirect_to new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article successfully edited!"
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    flash[:notice] = "Article successfully deleted!"
    @article.destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
