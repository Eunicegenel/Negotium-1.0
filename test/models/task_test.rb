require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test 'should not save when any vital information is missing' do
    task = Task.new
    task.task_details = 'Lorem ipsum dolor sit amet, 
                        consectetur adipiscing elit.'
    assert_not task.save, 'lacking information for tasks'
  end
end
