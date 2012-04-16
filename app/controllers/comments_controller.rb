class CommentsController < ApplicationController
  # creates a comment and binds it to a bug and the user submitting the bug  
    def create
      @bug = Bug.find(params[:bug_id])
      @comment = @bug.comments.build(params[:comment])
      @comment.user = current_user

      respond_to do |format|
          if @comment.save
            format.html { redirect_to(@bug, :notice => 'Comment was successfully created.') }
          else
            format.html { redirect_to(@bug, :notice => 'There was an error saving your comment (empty comment or comment way to long).') }
          end
          format.html { redirect_to(@bug, :notice => 'Comments are limited to published bugs.') }
        end  
    end

    # deletes a comment
    def destroy
      @comment = current_user.comments.find(params[:id])
      @bug = Bug.find(params[:bug_id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to @bug }
      end
    end
end
