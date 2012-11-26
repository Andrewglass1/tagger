class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params[:article])
    if @article.save
      entry = @article.create_entry_for
      redirect_to entry_path(entry)
    else
      redirect_to root
    end    
  end
  def create_entry
    @article = Article.find(params[:article_id])
    entry = @article.create_entry_for
    redirect_to entry_path(entry)
  end
end
