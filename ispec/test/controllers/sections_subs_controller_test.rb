require 'test_helper'

class SectionsSubsControllerTest < ActionController::TestCase
  test "should get sections_id" do
    get :sections_id
    assert_response :success
  end

  test "should get subsection_id" do
    get :subsection_id
    assert_response :success
  end

end
