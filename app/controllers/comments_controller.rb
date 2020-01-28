class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
	def index
		@user = User.find(params[:user_id])
		@post =  Post.find(params[:post_id])
		@comments = @post.comments
	end   

	def new
		@comment = Comment.new
	end

	def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to  user_post_path(params[:user_id],params[
          :post_id]), notice: 'comment was successfully created.' } 
      else
        format.html { render :new }
      end
    end   
  end

  def edit
  	@user = User.find(params[:user_id])
  	@post = Post.find_by_id(params[:id])
  end  

  def update
    respond_to do |format|
   	  if @comment.update(comment_params)
        format.html { redirect_to user_post_path(params[:user_id],params[
          :post_id]), notice: 'comment was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to user_post_path(params[:user_id],params[
          :post_id]), notice: 'comment was successfully deleted.' }
      end
    end 
 	end

  private
    def set_comment
      @comment = Comment.find_by_id(params[:id])
    end

	  def comment_params
	    params.require(:comment).permit(:text_comments, :user_id, :post_id)
	  end	
end