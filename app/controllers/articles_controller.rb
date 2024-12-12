class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit,]

  def index
    @articles = Article.all 
  end

  def about
  end

  def edit
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article),notice: '保存できました'
    else
      flash.now[:error] ='保存に失敗しました'
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end