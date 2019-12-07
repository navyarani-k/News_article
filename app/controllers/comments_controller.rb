class CommentsController < ApplicationController
	before_action :fetch_article
	
	private 
	def fetch_article
		@article = Article.find(params[:article_id])
	end
	
end
