class ArticlesController < ApplicationController

	before_filter :require_login, only: [:new, :create, :edit, :update]

	include ArticlesHelper

	def index 
		if params[:month] && params[:year] && params[:month] != "0" && params[:year] != "0"
			@articles = Article.where("strftime('%m', created_at) + 0 = ? AND strftime('%Y', created_at) + 0 = ?", 
							                   params[:month].to_i, params[:year].to_i)
			flash.notice = "There are no articles in the period selected" if @articles.empty?
		else
			@articles = Article.all
		end
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id
		@article.increment_view_count
		@article.save
	end

	def new
		@article = Article.new
	end

	def create
		# fail / uncomment to see the structure

		# Before including ArticlesHelper:
		# @article = Article.new(params[:article])

		@article = Article.new(article_params)
		@article.author = current_user
		@article.save

		flash.notice = "Article #{@article.title} created"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article #{@article.title} deleted"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article #{@article.title} updated"

		redirect_to article_path(@article)
	end

	def most_viewed
		@articles = Article.order(view_count: :desc).limit(3)
		render "index"
	end

	def feed
		@articles = Article.all
		respond_to do |format|
			format.rss { render :layout => false}
		end
	end

end
