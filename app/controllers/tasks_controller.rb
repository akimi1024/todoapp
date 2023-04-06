class TasksController < ApplicationController
  

  def index
    board = board_params

  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    board = board_params
    @task = board.tasks.build
  end

  def create
    board = board_params
    @task = board.tasks.build(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to board_path(board), notice: 'タスクを追加'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@task), notice: '更新しました'
    else
      flash.now[:error] = '更新できませんでした'
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(task.board_id), notice: 'cardを削除しました'

  end

  private
  def task_params
    params.require(:task).permit(:task_title, :task_content, :ststus, :limit, :eyecatch)

  end

  def board_params
    Board.find(params[:board_id])
  end 
end