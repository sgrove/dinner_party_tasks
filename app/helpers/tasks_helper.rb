module TasksHelper

  def checkbox_for(task)
    check_box_tag "finish_#{task.id}", 1, task.finished?, :disabled=>task.finished?
  end
end
