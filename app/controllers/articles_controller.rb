class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]
  def index
    @articles = Article.includes(:comments).article_created_date

  end
  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	 if @article.save #false
  	 	#flash.now[:info] = 'Article created'
  	 	redirect_to @article
  	 else
  	 	logger.debug 'NAVYA_RANI'
  	 	logger.debug @article.errors
  	 	#flash[:info] = 'Failed '
  	 	render 'new'
  	 end
  end

  def show
    #logger.debug params.inspect
    @article = Article.includes(:comments).find(params[:id])
  end
  def destroy
  	#del = Article.find(params[:id])
  	@article.destroy if @article
  	redirect_to articles_path
  end
  def edit
    #@article = Article.find(params[:id])
  end
  def update
       # @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to @article
        else
          render 'new'
        end

  end

  private
   def article_params
   	  params.require(:article).permit(:headline, :body, :summary, :conclusion, :ticker)
   end
   def find_article
     @article = Article.find(params[:id])
   end
end
