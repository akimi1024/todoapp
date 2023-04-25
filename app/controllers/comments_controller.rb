class CommentsController < ApplicationController

def new
  task = Task.find(params[:task_id])
  @comment = task.comments.build
end

def create
  task = Task.find(params[:task_id])
  @comment = task.comments.build(comment_params)
  @comment.user_id = current_user.id
  if @comment.save
    redirect_to task_path(@comment.task), notice: 'コメントを追加しました'
  else
    flash.now[:error] = '更新できませんでした'
  end
end

private
def comment_params
  params.require(:comment).permit(:comment_content)
end

end