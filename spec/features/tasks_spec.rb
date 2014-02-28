require 'spec_helper'

feature 'User manages tasks' do

  background do
    @user = create(:user)
  end


  scenario 'user adds task' do
    task_name = 'Test Task #1'

    login @user

    create_task(task_name)

    expect(page).to have_content task_name
  end

  scenario 'user completes task' do
    task_name = "Text Task #1"

    login @user

    create_task(task_name)

    complete_task(task_name)

    expect(page).to have_completed_task(task_name)

  end

  def create_task(task_name)
    click_link "Tasks"
    click_link "New Task"
    fill_in "Text", with: task_name
    click_button "Crear Tarea"
  end

  def complete_task(task_name)
    within "li:contains('#{task_name}')" do
      click_link "Complete"
    end
  end

  def have_completed_task(task_name)
    have_css 'li.completed', text: task_name
  end


end
