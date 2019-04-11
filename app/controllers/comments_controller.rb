class CommentsController < ApplicationController
    def create
      @user = User.find(current_user.id)
      @place = Place.find(params[:place_id])
      @comment = Comment.create(commenter:params[:comment][:commenter],
                                body:params[:comment][:body],
                                place_id:params[:place_id],
                                user_id:current_user.id)
      redirect_to place_path(@place)
      end
     
      def destroy
        @place = Place.find(params[:place_id])
        @comment = @place.comments.find(params[:id])
        @comment.destroy
        redirect_to place_path(@place)
      end

      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
