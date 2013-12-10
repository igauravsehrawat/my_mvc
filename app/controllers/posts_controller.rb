class PostsController < ApplicationController
	def new
		@post=Post.new
	end

	def create
		#render text: params[:post].inspect
		@post =Post.new(post_params)

		@post.save
		redirect_to @post
	end


	def show
			@post =Post.find(params[:id])
			@comment=Comment.new
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

	def edit
  		@post = Post.find(params[:id])
	end

	def update 
		@post=Post.find(params[:id])
		if @post.update(params[:post].permit(:title,:text))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
	  	@post.destroy
	 
	  redirect_to posts_path
	end


end


