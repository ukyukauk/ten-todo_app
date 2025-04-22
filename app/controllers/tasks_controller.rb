class TasksController < ApplicationController
  before_action :set_board, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
    @comments = @task.comments
  end

  def new
    @task = @board.tasks.build
    @task.user = current_user
  end

  def create
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_path(@board), notice: 'タスクを投稿しました'
    else
      flash.now[:error] = 'タスクの投稿に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@task.board, @task), notice: 'タスクを更新しました'
    else
      flash.now[:error] = 'タスクの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(task.board), status: :see_other, notice: 'タスクを削除しました'
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :eyecatch)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

end
