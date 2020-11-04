class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :show, :update, :destroy, :upvote, :downvote]

  def index 
    @articles = Article.all
  end

  def new 
    @article = Article.new 
  end

  def create 
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article Successfully Added"
      redirect_to root_path
    else
      render 'new'
    end
  end 

  def show 
  end

  def edit
  end

  def update 
    if @article.update(article_params)
      flash[:success] = "Article Successfully Updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy 
    if @article.destroy
      flash[:success] = "Article Successfully Deleted"
      redirect_to root_url
    else
      flash[:danger] = "Article Deletion Failed"
      redirect_to root_url
    end
  end

  def upvote
    @article.votes.create
    flash[:success] = "Vote Added"
    redirect_to article_path(@article)
  end

  def downvote
    if @article.votes.count > 0
      @article.votes.last.destroy
      redirect_to article_path(@article)
    else
      flash[:danger] = "Already has 0 votes"
      redirect_to article_path(@article)
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
