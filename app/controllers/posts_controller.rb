class PostsController < ApplicationController
	def new
		
	end

	def create
		#render text: params[:post].inspect
		@post =Post.new(post_params)

		@post.save
		redirect_to @post
	end


	def show
			@post =Post.find(params[:id])
		end
	#listing all the posts in the db
	def index
		@posts=Post.all
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
		#show method to show the post tile and text

		


end


