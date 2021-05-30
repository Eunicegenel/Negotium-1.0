require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should not save when one credential is missing' do
    user = User.new
    assert_not user.save, 'Saved user lacking credential/s'
  end
end
