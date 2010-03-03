require 'selenium/selenium_test_case'

class TaskTest < SeleniumTestCase

  def test_index
    visit tasks_path
    assert_contain "Listing tasks"
  end

  def test_new_task
    visit tasks_path
    selenium.click "link=New task", :wait_for=>:page

    selenium.type "task[title]", "Mix pizza dough"
    selenium.type "task[description]", "Use stand mixer"
    selenium.check "id=task_active"

    assert true, selenium.checked?("id=task_active")


    # There is more than one way to submit the form -- here is a handful of options
#    selenium.click "id=task_submit", :wait_for=>:page

#    selenium.submit "id=new_task"
#    selenium.wait_for_page_to_load

    selenium.click "css=input[type='submit']", :wait_for=>:page

    assert_contain "Task was successfully created"

    selenium.click "link=Back", :wait_for=>:page


    active_tasks = selenium_eval("jQuery('tr.active').length")
    assert_equal 1, active_tasks.to_i
    
  end


  

end