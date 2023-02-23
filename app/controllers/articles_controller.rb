class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
def new
  @article = Article.new
end

def create
  @article = Article.new(article_params)
  @article.user = current_user
  if @article.save
   flash[:notice] = "Article was successfully created"
   redirect_to article_path(@article)
  else
   render 'new'
  end
end

def show
end

def update
  if current_user.id == @article.user_id
    if @article.update(article_params)
    flash[:notice] = "Article was updated"
    redirect_to article_path(@article)
    else
    flash[:notice] = "Article was not updated"
    render 'edit'
    end
  end
end

def edit
end

def index
  @pagy, @articles = pagy(Article.all,items:5)
end

def destroy
  if current_user.id == @article.user_id
    @article.destroy
    # flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end
end

private
  def article_params
   params.require(:article).permit(:title, :description,:user_id)
  end
  
  def set_article
   @article = Article.find(params[:id])
  end
end