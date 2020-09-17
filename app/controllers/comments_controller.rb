class CommentsController < ApplicationController
  before_action :find_commentable
  
      def new
        @comment = Comment.new
      end
  
      def create
        @comment = @commentable.comments.new comment_params.merge(user_id: current_user.id)
  
        if @comment.save
          redirect_back(fallback_location: root_path)
        else
          render json: @comment.errors
        end
      end
  
      private
  
      def comment_params
        params.require(:comment).permit(:body, :user_id)
      end
  
      def find_commentable
        @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
        @commentable = Product.find(params[:product_id]) if params[:product_id]
        @commentable = User.find(params[:user_id]) if params[:user_id]
      end
  
  end
  