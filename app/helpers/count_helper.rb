module CountHelper
  def count_tasks
    @task_count ||= Task.where("completed_at IS NOT NULL").count
  end
end
