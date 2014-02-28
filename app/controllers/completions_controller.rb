class CompletionsController < ApplicationController
  before_filter :authorize

  def create
    Task.find(params[:task_id]).touch(:completed_at)

    redirect_to tasks_path
  end
end
