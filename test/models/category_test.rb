require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test 'should not save without category name & user id' do
    category = Category.new
    category.category_details = 'Lorem ipsum dolor sit amet, 
                            consectetur adipiscing elit.'
    assert_not category.save, 'Saved category without name & user id'
  end
end
