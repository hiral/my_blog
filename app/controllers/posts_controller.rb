class PostsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :destroy]
  before_action :set_post, only: [:index,:show, :edit, :update, :destroy]
	def index
		@posts = @user.posts
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
    respond_to do |format|
  	  if	@post.save 
  	     format.html { redirect_to user_posts_path(params[:user_id]), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

    def edit
    end 

    def show
      @comments = @post.comments
      @comment = Comment.new
    end  

  	def update
      respond_to do |format|
   	 	  if @post.update(post_params)
    	   format.html { redirect_to user_posts_path(params[:user_id]), notice: 'Post was successfully updated.' }
        else
          format.html { render :new }
        end
      end
  	end

  	def destroy
    	respond_to do |format|
    	 if @post.destroy()
    	   format.html { redirect_to user_posts_path(params[:user_id]), notice: 'Post was successfully deleted.' }
       end 
      end
 	  end


  private
    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def set_post
      @post = Post.find_by_id(params[:id])
    end

	  def post_params
	    params.require(:post).permit(:title, :discription, :user_id, :id)
	  end	
end  
