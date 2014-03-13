class TasksController < ApplicationController
  before_filter :authorize

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to tasks_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

private

  def task_params
    params.require(:task).permit(:text, :completed, :user_id)
  end

end
