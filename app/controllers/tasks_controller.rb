class TasksController < ApplicationController
  def new
    @tasks = Task.new
  end

  def index
    @tasks = Task.all
  end
  def create
    @tasks = Task.new(tasks_params)

    if @tasks.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])

    if @tasks.update(tasks_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
  end

  private

  # Strong Parameter
  def tasks_params
    params.require(:task).permit(:content)
  end
end
