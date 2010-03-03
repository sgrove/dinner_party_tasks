require 'selenium/selenium_test_case'

class TaskTest < SeleniumTestCase

#  def test_index
#    visit tasks_path
#    assert_contain "Listing tasks"
#  end
#
#  def test_new_task
#    visit tasks_path
#    selenium.click "link=New task", :wait_for=>:page
#
#    selenium.type "task[title]", "Mix pizza dough"
#    selenium.type "task[description]", "Use stand mixer"
#    selenium.check "id=task_active"
#
#    assert true, selenium.checked?("id=task_active")
#
#
#    # There is more than one way to submit the form -- here is a handful of options
##    selenium.click "id=task_submit", :wait_for=>:page
#
##    selenium.submit "id=new_task"
##    selenium.wait_for_page_to_load
#
#    selenium.click "css=input[type='submit']", :wait_for=>:page
#
#    assert_contain "Task was successfully created"
#
#    selenium.click "link=Back", :wait_for=>:page
#
#
#    active_tasks = selenium_eval("jQuery('tr.active').length")
#    assert_equal 1, active_tasks.to_i
#
#  end
#

  def test_dragging_tasks

    mix_dough = Task.create(:title=>"Mix pizza dough", :active=>true, :minutes=>15)
    dough_rest = Task.create(:title=>"Let dough rest", :active=>false, :minutes=>120)

    selenium.open "/tasks"
    selenium.wait_for_page_to_load

    assert_contain "Mix pizza dough"

    mix_top = selenium.get_element_position_top("id=task_#{mix_dough.id}")
    mix_left = selenium.get_element_position_left("id=task_#{mix_dough.id}")

    selenium.drag_and_drop("id=task_#{mix_dough.id}", "+0,+200")

    assert_equal mix_top.to_i + 200, selenium.get_element_position_top("id=task_#{mix_dough.id}").to_i
  end

  def test_active_tasks_are_not_droppable
    mix_dough = Task.create(:title=>"Mix pizza dough", :active=>true, :minutes=>15)
    dough_rest = Task.create(:title=>"Let dough rest", :active=>false, :minutes=>120)

    selenium.open "/tasks"
    selenium.wait_for_page_to_load

    dough_top = selenium.get_element_position_top("id=task_#{dough_rest.id}")
    dough_left = selenium.get_element_position_top("id=task_#{dough_rest.id}")

    selenium.drag_and_drop_to_object("id=task_#{dough_rest.id}", "id=task_#{mix_dough.id}")


    # too brittle -- wait for text?
    selenium.wait_for_text "Oops -- you can't drop an inactive task onto another task."
  end

end